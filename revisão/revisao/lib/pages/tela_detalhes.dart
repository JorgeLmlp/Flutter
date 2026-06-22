import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_animated_controler.dart';
import 'package:revisao/pages/tela_animated_opacity.dart';
import 'package:revisao/pages/tela_animated_container.dart';
import 'package:revisao/pages/tela_page_route.dart';

class TelaDetalhes extends StatelessWidget{
  const TelaDetalhes({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Revisão Flutter')),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.school,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text('animacao implicita e explicita', 
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            
            ),
            const SizedBox( height: 10,),
            const Text('escolha um tipo de animacao', textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                  return const TelaAnimatedContainer();
                },
                
                
                ),
              
              );
            },
            
            icon: const Icon(Icons.animation),
            label: const Text('AnimatedContainer'),
            ),
              ElevatedButton.icon(
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                  return const TelaAnimatedOpacity();
                },
                
                
                ),
              
              );
            },
            icon: const Icon(Icons.animation),
            label: const Text('AnimatedOpacity'),
            ),
             ElevatedButton.icon(
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                  return const TelaAnimatedController();
                },
                
                
                ),
              
              );
            },
            icon: const Icon(Icons.animation),
            label: const Text('AnimatedControler'),
             ),
             ElevatedButton.icon(
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                  return const TelaPageRoute();
                },
                
                
                ),
              
              );
            },
            icon: const Icon(Icons.animation),
            label: const Text('AnimatedPageRoute'),
             ),
             
            
          ],
        ),
        ),
      )));
  }
}