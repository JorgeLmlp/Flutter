import 'package:flutter/material.dart';
import '../pages/tela_jogos.dart';


enum TipoBotao { modal, mudarPagina, contador }

class Botao extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;
  final TipoBotao tipo; 

  const Botao({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.textoBotao,
    required this.cor,
    this.tipo = TipoBotao.contador,
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

  void _mudarPagina(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TelaJogos('telajogos')),
    );
  }

  void _mostrarModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Modal inferior',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Esse modal aparece vindo de baixo.'),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
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
        onPressed: () {
        
          switch (widget.tipo) {
            case TipoBotao.modal:
              _mostrarModal(context);
              break;
            case TipoBotao.mudarPagina:
              _mudarPagina(context);
              break;
            case TipoBotao.contador:
              _incrementCounter();
              break;
          }
        },
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
            
              if (widget.tipo == TipoBotao.contador)
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