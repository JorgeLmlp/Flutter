import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bear/viewModels/pedido_viewmodel.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final clienteController = TextEditingController();
  final pratoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final valorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<PedidoViewModel>().carregarPedidos();
    });
  }

  @override
  void dispose() {
    clienteController.dispose();
    pratoController.dispose();
    quantidadeController.dispose();
    valorController.dispose();
    super.dispose();
  }

  Future<void> cadastrarPedido() async {
    final cliente = clienteController.text.trim();
    final prato = pratoController.text.trim();

    final quantidade = int.tryParse(
      quantidadeController.text.trim(),
    );

    final valor = double.tryParse(
      valorController.text.trim().replaceAll(',', '.'),
    );

    if (cliente.isEmpty ||
        prato.isEmpty ||
        quantidade == null ||
        valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os dados corretamente'),
        ),
      );

      return;
    }

    if (quantidade <= 0 || valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Quantidade e valor devem ser maiores que zero',
          ),
        ),
      );

      return;
    }

    await context.read<PedidoViewModel>().cadastrarPedido(
          cliente: cliente,
          prato: prato,
          quantidade: quantidade,
          valorUnitario: valor,
        );

    if (!mounted) return;

    clienteController.clear();
    pratoController.clear();
    quantidadeController.clear();
    valorController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pedido cadastrado com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PedidoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),

      body: SingleChildScrollView(
  padding: const EdgeInsets.all(16),

  child: Column(
    children: [
      TextField(
        controller: clienteController,
        decoration: const InputDecoration(
          labelText: 'Cliente',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: pratoController,
        decoration: const InputDecoration(
          labelText: 'Prato',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: quantidadeController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Quantidade',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: valorController,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: const InputDecoration(
          labelText: 'Valor unitário',
          prefixText: 'R\$ ',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 15),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: cadastrarPedido,
          child: const Text(
            'CADASTRAR PEDIDO',
          ),
        ),
      ),

      const SizedBox(height: 20),

      const Divider(),

      const SizedBox(height: 10),

      if (viewModel.carregando)
        const Padding(
          padding: EdgeInsets.all(30),
          child: CircularProgressIndicator(),
        )

      else if (viewModel.pedidos.isEmpty)
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            'Nenhum pedido cadastrado',
          ),
        )

      else
        ListView.builder(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: viewModel.pedidos.length,

          itemBuilder: (context, index) {
            final pedido =
                viewModel.pedidos[index];

            return Card(
              margin: const EdgeInsets.only(
                bottom: 15,
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      pedido.cliente,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Prato: ${pedido.prato}',
                    ),

                    Text(
                      'Quantidade: ${pedido.quantidade}',
                    ),

                    Text(
                      'Valor unitário: '
                      'R\$ ${pedido.valorUnitario.toStringAsFixed(2).replaceAll('.', ',')}',
                    ),

                    Text(
                      'Total: '
                      'R\$ ${pedido.total.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Classificação: ${pedido.classificacao}',
                    ),

                    Text(
                      'Status: ${pedido.status}',
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child:
                              ElevatedButton.icon(
                            onPressed:
                                pedido.status ==
                                        'Finalizado'
                                    ? null
                                    : () async {
                                        await viewModel
                                            .finalizarPedido(
                                          pedido.id!,
                                        );
                                      },
                            icon: const Icon(
                              Icons.check,
                            ),
                            label: Text(
                              pedido.status ==
                                      'Finalizado'
                                  ? 'FINALIZADO'
                                  : 'FINALIZAR',
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child:
                              ElevatedButton.icon(
                            onPressed: () async {
                              await viewModel
                                  .excluirPedido(
                                pedido.id!,
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                            label: const Text(
                              'EXCLUIR',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    ],
  )
  )
  );
  }
}