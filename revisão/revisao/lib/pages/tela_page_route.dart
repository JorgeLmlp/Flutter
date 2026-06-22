import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_login.dart';

class TelaPageRoute extends StatelessWidget{
  const TelaPageRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( 'telaPageRoute'),
      ),
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.open_in_new,
              size: 80,
              color: Colors.purple,
            ),
            const SizedBox(height: 20),
            const Text('PageRouteBuilder',
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              Navigator.push(
              context, 
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation){
                  return const TelaLogin();
                },
                transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
                ){
                  return SlideTransition(position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero
                  ).animate(animation),
                  child: child,
                  );
                },
                ),
              );
            }, 
              child: const Text('Abrir tela com animação', style: TextStyle(
                textAlign : TextAlign.center
              ),), )
            
          ],
       ),
        ),
      ),
    );
  }
}