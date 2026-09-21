import 'package:ativdade_widget/widgets/botao.dart'; // Importante para reconhecer o Botao e o TipoBotao
import 'package:flutter/material.dart';

class MeuCard extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Map<String, Color> colors;
  final TipoBotao tipoBotao;

  const MeuCard(
    this.icone, 
    this.titulo, 
    this.descricao, 
    this.textoBotao, 
    this.colors, {
    super.key, 
    this.tipoBotao = TipoBotao.contador,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors['primary'] ?? Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                
               
                Botao(
                  icone: icone,
                  titulo: titulo, 
                  descricao: descricao,
                  textoBotao: textoBotao,
                  cor: colors['primary'] ?? Colors.orange, 
                  tipo: tipoBotao, 
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          Icon(
            icone,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}