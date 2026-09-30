import 'package:central_de_missoes/pages/pagina_missoes.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int energia = 50;

  void aumentarEnergia(int quantidade) {
    setState(() {
      if (energia < 100) {
        energia += quantidade;
      }
    });
  }

  void diminuirEnergia(int quantidade) {
    setState(() {
      if (energia > 50) {
        energia -= quantidade;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Central de Missões"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.satellite, size: 80),
          const TextField(
            decoration: InputDecoration(
              labelText: "Digite o nome do astronauta",
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Digite o planeta de destino",
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Energia: $energia",
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            
          )
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: diminuirEnergia,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: aumentarEnergia,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Paginamissoes(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
