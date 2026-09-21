import 'package:flutter/material.dart';
import 'package:jorge_luis/models/responsavel.dart';
import 'package:jorge_luis/pages/tela_cuidado_pet.dart';

class CadastroResponsavel extends StatefulWidget {
  const CadastroResponsavel({super.key});

  @override
  State<CadastroResponsavel> createState() => _CadastroResponsavelState();
}

class _CadastroResponsavelState extends State<CadastroResponsavel> {
  final nomeResponsavelController = TextEditingController();
  final telefoneResponsavelController = TextEditingController();
  @override
  void dispose() {
    nomeResponsavelController.dispose();
    telefoneResponsavelController.dispose();
    super.dispose();
  }

  Responsavel criarResponsavel(nome, telefone) {
    Responsavel responsavel = Responsavel(nome, telefone);
    return responsavel;
  }

  @override
  Widget build(BuildContext context) {
    final estiloBorda = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 1.0));
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "CadastroResponsavel",
        textAlign: TextAlign.center,
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: telefoneResponsavelController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantidade máxima de participantes",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: estiloBorda,
                  enabledBorder: estiloBorda,
                ),
              ),
              TextField(
                controller: nomeResponsavelController,
                decoration: InputDecoration(
                  labelText: "Nome do responsável",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: estiloBorda,
                  enabledBorder: estiloBorda,
                ),
              ),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CuidadoPet(),
                )),child: Text("enviar"))
            ],
          ),
        ),
      ),
    );
  }
}
