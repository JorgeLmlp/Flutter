import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
    runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 204, 204, 204),
          secondary: Colors.deepPurple
        ),

      ),
      home : TelaDesign(),
    );
  }
}
class TelaDesign extends StatefulWidget {
  const TelaDesign({super.key});

  @override
  State<TelaDesign> createState() => _TelaDesignState();
}

class _TelaDesignState extends State<TelaDesign> {

  int _indiceAtual = 0;

  final List<Map<String, String>> _personagens = [
    {
      'titulo': 'Fire Force',
      'nome': 'Haumea',
      'imagem': 'https://static.wikia.nocookie.net/fire-brigade-of-flames/images/1/11/Haumea_Infobox.png/revision/latest/scale-to-width-down/250?cb=20200725133844',
      'descricao': 'Embora inicialmente quieta e um tanto indiferente, Haumea logo revela um entusiasmo brincalhão por seus planos e objetivos. Mesmo sendo igual a Shō, ela não teme tratá-lo como uma criança e até mesmo usar suas habilidades nele para conseguir o que quer. Sua atitude otimista vem acompanhada de crueldade e sadismo, tanto para amigos quanto para inimigos.',
    },
    {
      'titulo': 'Fire Force',
      'nome': 'Shinra Kusakabe',
      'imagem': 'https://images.adagio.com/images2/custom_blends/208984.jpg',
      'descricao': 'Shinra é um soldado de bombeiros da Companhia 8. Ele sofre de uma condição chamada "Sorriso do Demônio", que o faz sorrir involuntariamente quando está nervoso ou sob estresse intenso. Ele possui a habilidade de gerar chamas pelos pés.',
    },
  ];

  void _proximoPersonagem() {
    setState(() {
      _indiceAtual = (_indiceAtual + 1) % _personagens.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final personagem = _personagens[_indiceAtual];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jorge',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: cores.secondary,
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: [
            Texto(personagem['titulo']!),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                personagem['imagem']!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Texto(personagem['nome']!),
            SubTitulo(personagem['descricao']!),
            Botao('Próximo', aoPressionar: _proximoPersonagem),
          ],
        ),
      ),
    );
  }
}

class Texto extends StatelessWidget {
  final String texto;

  const Texto(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
class SubTitulo extends StatelessWidget {
  final String texto;

  const SubTitulo(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
class Botao extends StatelessWidget
{
  final String texto;
  final VoidCallback aoPressionar; 
  const Botao(this.texto, {required this.aoPressionar, super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: aoPressionar,
        child: Text(texto),
    )
    );
  }
}