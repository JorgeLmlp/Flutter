import 'package:flutter/material.dart';

class TelaAnimatedController extends StatefulWidget{
  const TelaAnimatedController({super.key});
  @override
  State<TelaAnimatedController> createState(){
    return _TelaAnimatedControllerState();
  }
}
class _TelaAnimatedControllerState extends State<TelaAnimatedController> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> 
    tamanho;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    tamanho = Tween<double>(
      begin: 100,
      end: 250
    ).animate(controller);

    }
    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }
    void iniciarAnimacao(){
      controller.forward();
    }
    void voltarAnimacao(){
      controller.reverse();
    }
    void reiniciarAnimacao(){
      controller.forward(from: 0);
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animationcontroler')),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(animation: tamanho, builder:(context, child){
              return Container(
                width: tamanho.value,
                height: tamanho.value,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                  child: Text(
                    'Animação',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              );
            }
            ),
            ElevatedButton(onPressed: iniciarAnimacao, child: Text('iniciar animacao')),
            ElevatedButton(onPressed: voltarAnimacao, child: Text('voltar animacao')),
            ElevatedButton(onPressed: reiniciarAnimacao, child: Text('reiniciar animacao')),
          ],
        ),
      )),
    );
  }
}