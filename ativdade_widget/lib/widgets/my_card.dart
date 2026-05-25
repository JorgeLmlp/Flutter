import 'package:ativdade_widget/pages/tela_jogos.dart';
import 'package:ativdade_widget/widgets/botao.dart';
import 'package:flutter/material.dart';

class MeuCard extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Map<String, Color> colors;
  final bool abrirModal;
  final bool mudarPagina;

  const MeuCard(
      this.icone, this.titulo, this.descricao, this.textoBotao, this.colors,
      {super.key, this.abrirModal = false, this.mudarPagina = false});

  void _mudarPagina(BuildContext context)
  {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TelaJogos('telajogos')),
);
  }
  void _mostrarModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Modal inferior',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Esse modal aparece vindo de baixo.'),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors['primary'] ?? Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                abrirModal
                    ? ElevatedButton(
                        onPressed: () => _mostrarModal(context),
                        child: Text(textoBotao),
                      )
                    : Botao(icone, titulo, descricao, textoBotao,
                        Colors.transparent),
                 mudarPagina ?  ElevatedButton (
                  onPressed:() => _mudarPagina(context),
                  child: Text(textoBotao),

                 ) : Botao(icone, titulo, descricao, textoBotao,
                    Colors.transparent),

              ],
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            icone,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
