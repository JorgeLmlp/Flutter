import 'package:flutter/material.dart';
import '../widgets/my_card.dart';

  const Map<String, Color> colors1 = {
    'primary': Colors.lightGreen,
    'secondary': Colors.white,
  };
  const Map<String, Color> colors2 = {
    'primary': Colors.lightBlue,
    'secondary': Colors.white,
  };

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MeuCard(
            Icons.pets,
            'Pet',
            'icone Pet',
            'Texto Botao Pet',
            colors1,
            mudarPagina: true,
          ),
          MeuCard(
            Icons.power,
            'power',
            'icone power',
            'Texto Botao Power',
            colors2
          ),
          MeuCard(Icons.star, "Título", "Descrição", "Abrir Modal", {'primary': Colors.pink}, abrirModal: true)
        ])));
  }
}
