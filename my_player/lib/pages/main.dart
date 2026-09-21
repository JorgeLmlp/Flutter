import 'package:flutter/material.dart';
import 'package:my_player/widgets/card_musica.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: Text("homePage"),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CardMusica()
          ],
        ),
      ),
    ),
   );
  }
}