import 'package:flutter/material.dart';
import 'package:my_player/models/musica.dart';
class CardMusica extends StatefulWidget{
  final Musica musica;
  const CardMusica({super.key, this.musica});

  @override
  State<CardMusica> createState() => _CardMusicaState();

}
class _CardMusicaState extends State<CardMusica>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image(image: FileImage(widget.musica.capaPath))
        ],
      ),
    );
  }
}