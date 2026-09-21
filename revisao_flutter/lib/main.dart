import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:revisao_flutter/pages/segunda_tela.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'revisao',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 196, 196)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

}
void mudarPagina(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SegundaTela()),
    );
}
class MyButton extends StatelessWidget{
  final String pagina;
  MyButton({super.key, required this.pagina});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: mudarPagina(context), child: child)
  }





}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(Icons.phone_android, size: 80),
              Text('vamos revisar flutter')
            
            ])));
  }
}
