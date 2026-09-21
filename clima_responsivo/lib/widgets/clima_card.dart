import 'package:clima_responsivo/models/clima.dart';
import 'package:flutter/material.dart';

class ClimaCard extends StatelessWidget {
  final double largura;    
  final double altura;    // Corrigido para bater com os nomes que você usou na Home
  final double fontSize;
  final Clima clima;

  const ClimaCard({
    super.key, 
    required this.largura, 
    required this.altura, 
    required this.clima, 
    required this.fontSize,
  });

  // Função que escolhe o ícone ideal com base na condição do clima
  IconData _buscarIcone(ClimasPossiveis condicao) {
    switch (condicao) {
      case ClimasPossiveis.ensolarado:
        return Icons.wb_sunny_rounded;
      case ClimasPossiveis.chuvoso:
        return Icons.umbrella_rounded;
      case ClimasPossiveis.frio:
        return Icons.ac_unit_rounded;
      case ClimasPossiveis.ventoForte:
        return Icons.air_rounded;
      default:
        return Icons.cloud_rounded;
    }
  }

  // Função que escolhe a cor do ícone
  Color _buscarCorIcone(ClimasPossiveis condicao) {
    switch (condicao) {
      case ClimasPossiveis.ensolarado:
        return Colors.orangeAccent;
      case ClimasPossiveis.chuvoso:
        return Colors.blue;
      case ClimasPossiveis.frio:
        return Colors.cyan;
      case ClimasPossiveis.ventoForte:
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {

    final condicaoAtual = clima.climaAtual; 

    return Container( 
      width: largura,
      height: altura,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row( 
        children: [
          Icon(
            _buscarIcone(condicaoAtual),
            color: _buscarCorIcone(condicaoAtual),
            size: fontSize * 2.5,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  clima.cidade,
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  clima.temperatura,
                  style: TextStyle(fontSize: fontSize - 2, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}