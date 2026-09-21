import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? tipoSelecionado;

  final List<String> opcoes = [
    'Oficina',
    'Palestra',
    'Exposição',
    'Competição',
    'Apresentação cultural'
  ];

  final nomeAtividadeController = TextEditingController();
  final responsavelController = TextEditingController();
  final localController = TextEditingController();
  final maxParticipantesController = TextEditingController();

  @override
  void dispose() {
    nomeAtividadeController.dispose();
    responsavelController.dispose();
    localController.dispose();
    maxParticipantesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Estilo padrão de borda preta arredondada reaproveitado para todos os campos
    final estiloBorda = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black, width: 1.0),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeAtividadeController,
              decoration: InputDecoration(
                labelText: "Nome da atividade",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: estiloBorda,
                enabledBorder: estiloBorda,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: responsavelController,
              decoration: InputDecoration(
                labelText: "Nome do responsável",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: estiloBorda,
                enabledBorder: estiloBorda,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: localController,
              decoration: InputDecoration(
                labelText: "Sala ou local",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: estiloBorda,
                enabledBorder: estiloBorda,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: maxParticipantesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantidade máxima de participantes",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: estiloBorda,
                enabledBorder: estiloBorda,
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                return DropdownMenu<String>(
                  initialSelection: tipoSelecionado,
                  // Garante que o dropdown tenha a mesma largura exata dos outros inputs
                  width: constraints.maxWidth, 
                  menuHeight : 300,
                  // 💡 ISSO impede que o menu suba: força a abertura fixa para baixo
                  menuStyle: const MenuStyle(
                    alignment: Alignment.bottomLeft,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: estiloBorda,
                    enabledBorder: estiloBorda,
                  ),
                  label: const Text("Tipo de atividade"),
                  dropdownMenuEntries: opcoes.map((String item) {
                    return DropdownMenuEntry<String>(
                      value: item,
                      label: item,
                    );
                  }).toList(),
                  onSelected: (String? novoValor) {
                    setState(() {
                      tipoSelecionado = novoValor;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}