import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;

  const Botao(
    this.icone,
    this.titulo,
    this.descricao,
    this.textoBotao,
    this.cor, {
    super.key,
  });

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 66,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.cor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: _incrementCounter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(widget.icone, color: Colors.white),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.descricao,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Text(
                '$_counter',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}