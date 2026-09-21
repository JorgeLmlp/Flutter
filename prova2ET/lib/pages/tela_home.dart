import 'package:flutter/material.dart';
import 'package:jorge_luis/pages/tela_cadastro_responsavel.dart';
import 'package:jorge_luis/pages/tela_cuidado_pet.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [
          ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CadastroResponsavel(),
                )),child: Text("CadastrarUsuario")),
                ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CuidadoPet(),
                )),child: Text("cuidar pet"))
        ],),),
      ),
    );
  }
}
