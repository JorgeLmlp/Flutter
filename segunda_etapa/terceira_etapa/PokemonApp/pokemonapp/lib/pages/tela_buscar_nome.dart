import 'package:flutter/material.dart';

class TelaBuscarNome extends StatefulWidget {
  const TelaBuscarNome({super.key});

  @override
  State<TelaBuscarNome> createState() => _TelaBuscarNomeState();
}

class _TelaBuscarNomeState extends State<TelaBuscarNome> {
  final buscarNomeController = TextEditingController();
final estiloBorda = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 1.0));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
                children: [
                    SizedBox(height: 20),
                    TextField(controller: buscarNomeController,keyboardType: TextInputType.text,                
                    decoration: InputDecoration(
                    labelText: "buscar pokemon pelo nome",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: estiloBorda,
                    enabledBorder: estiloBorda,
                ),)
                ],
            ),
        ),
    );
  }
}