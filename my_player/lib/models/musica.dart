


import 'dart:io';


class Musica{
  bool estadoPlayer = false;
  final String nomeMuisca, artista;
  final File capaPath;

  Musica(
    this.artista,
    this.nomeMuisca,
    this.capaPath
  );
  
}