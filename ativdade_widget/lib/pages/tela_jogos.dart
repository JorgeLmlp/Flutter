import 'package:flutter/material.dart';

class TelaJogos extends StatelessWidget {
  const TelaJogos( String title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
              child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('tela jogos'),
                  Text('essa é a tela jogos'),
                  Text('meus jogos favoritos sao: '),
                  Text('- Hollow Knight, forza5')
                
             ])));
  }
}
