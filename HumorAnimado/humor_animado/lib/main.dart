import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const HumorAnimadoPagina(),
    ),
  );
}

class HumorAnimadoPagina extends StatelessWidget {
  const HumorAnimadoPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const HumorAnimado(),
    );
  }
}

class HumorAnimado extends StatefulWidget {
  const HumorAnimado({super.key});

  @override
  State<HumorAnimado> createState() => _HumorAnimadoState();
}

class _HumorAnimadoState extends State<HumorAnimado> {
  String humor = "Nenhum";
  Color cor = Colors.grey;
  double tamanho = 180;
  double borda = 20;
  IconData icone = Icons.sentiment_neutral;
  String texto = "Escolha um humor!";
  bool mostrarMensagem = false;

  void alterarHumor(String novoHumor) {
    setState(() {
      humor = novoHumor;
      mostrarMensagem = true;

      switch (novoHumor) {
        case "Feliz":
          cor = Colors.amber;
          tamanho = 220;
          borda = 50;
          icone = Icons.sentiment_very_satisfied;
          texto = "Feliz";
          break;

        case "Calmo":
          cor = Colors.lightBlue;
          tamanho = 200;
          borda = 30;
          icone = Icons.cloud;
          texto = "calmo";
          break;

        case "Animado":
          cor = Colors.orange;
          tamanho = 240;
          borda = 10;
          icone = Icons.flash_on;
          texto = "animado";
          break;

        case "Triste":
          cor = Colors.blueGrey;
          tamanho = 180;
          borda = 40;
          icone = Icons.cloudy_snowing;
          texto = "Triste";
          break;
      }
    });
  }

  Widget cenaAnimada() {
    IconData cenaIcone = Icons.star;

    switch (humor) {
      case "Feliz":
        cenaIcone = Icons.wb_sunny;
        break;
      case "Calmo":
        cenaIcone = Icons.cloud;
        break;
      case "Animado":
        cenaIcone = Icons.bolt;
        break;
      case "Triste":
        cenaIcone = Icons.grain;
        break;
    }

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.8, end: 1.2),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Icon(
            cenaIcone,
            size: 70,
            color: Colors.white,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor.withOpacity(0.3),
      appBar: AppBar(
        title: const Text("Humor Animado"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Escolha seu humor do momento",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => alterarHumor("Feliz"),
                  child: const Text("Feliz"),
                ),
                ElevatedButton(
                  onPressed: () => alterarHumor("Calmo"),
                  child: const Text("Calmo"),
                ),
                ElevatedButton(
                  onPressed: () => alterarHumor("Animado"),
                  child: const Text("Animado"),
                ),
                ElevatedButton(
                  onPressed: () => alterarHumor("Triste"),
                  child: const Text("Triste"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              width: tamanho,
              height: tamanho,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(borda),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icone,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    texto,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            AnimatedOpacity(
              opacity: mostrarMensagem ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Text(
                "Você escolheu o humor $humor",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            AnimatedOpacity(
              opacity: humor == "Nenhum" ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: cenaAnimada(),
            ),
          ],
        ),
      ),
    );
  }
}