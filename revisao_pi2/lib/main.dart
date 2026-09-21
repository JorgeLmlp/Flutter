import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'pages/lanchonete.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeLanchonete(),
    );
  }
}

