import 'package:clima_responsivo/models/clima.dart';
import 'package:clima_responsivo/widgets/clima_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    Map<String, Clima> climas = {
      "saoPaulo": Clima(
        ClimasPossiveis.chuvoso,
        "são paulo",
        "24 C°",
      ),
      "beloHorizonte": Clima(
        ClimasPossiveis.ensolarado,
        "Belo Horizonte",
        "31 C°",
      ),
       "xiqueXique": Clima(
        ClimasPossiveis.frio,
        "Xique xique",
        "15 C°",
      ),
      "pindamonhangaba": Clima(
        ClimasPossiveis.ventoForte,
        "Pindamonhangaba",
        "22 C°",
      ),
      "rioDeJaneiro": Clima(
        ClimasPossiveis.ensolarado,
        "Rio de janeiro",
        "40C°",
      ),
      "fozDoiguacu": Clima(
        ClimasPossiveis.frio,
        "foz do iguacu",
        "5 C°",
      ),
      "s": Clima(
        ClimasPossiveis.chuvoso,
        "são paulo",
        "24 C°",
      ),
      "b": Clima(
        ClimasPossiveis.ensolarado,
        "Belo Horizonte",
        "31 C°",
      ),
       "x": Clima(
        ClimasPossiveis.frio,
        "Xique xique",
        "15 C°",
      ),
      "p": Clima(
        ClimasPossiveis.ventoForte,
        "Pindamonhangaba",
        "22 C°",
      ),
      "r": Clima(
        ClimasPossiveis.ensolarado,
        "Rio de janeiro",
        "40C°",
      ),
      "f": Clima(
        ClimasPossiveis.frio,
        "foz do iguacu",
        "5 C°",
      ),

    };

    final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClimaResponsivo"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final largura = constraints.maxWidth;
        final celular = largura < 600;
        final tablet = largura >= 600 && largura < 900;
        final desktop = largura >= 900;
        final listaDeCards = climas.values.map((clima) {
          return ClimaCard(
            
            largura: celular ? largura - 40 : (tablet ? (largura - 60) / 2 : (largura - 80) / 3),
            altura: celular ? 100 : 120,
            clima: clima,
            fontSize: desktop ? 22 : (tablet ? 18 : 16),
          );
        }).toList();
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Confira as condições do tempo em diversas cidades"),
               celular 
                  ? Column(children: listaDeCards) 
                  : Wrap(
                      spacing: 20, 
                      runSpacing: 20, 
                      children: listaDeCards,
                    ),
            ],
          ),
        );
      }),
    );
  }
}
