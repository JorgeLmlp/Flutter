import 'package:flutter/material.dart';

enum ClimasPossiveis {
  ensolarado(Icons.sunny),
  chuvoso(Icons.umbrella),
  frio(Icons.ac_unit),
  quente(Icons.wb_sunny_sharp),
  nublado(Icons.cloud),
  ventoForte(Icons.air);

  final IconData icone;

  // Construtor do enum
  const ClimasPossiveis(this.icone);
}

class Clima{
  final ClimasPossiveis climaAtual;
  final String cidade;
  final String temperatura;
  IconData get icone => climaAtual.icone;

  const Clima(this.climaAtual, this.cidade, this.temperatura);
}