import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget{
  SegundaTela({super.key})

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'segundaPagina',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 196, 196)),
          useMaterial3: true,
        ),
        home: const segundaPagina());
  }
}
