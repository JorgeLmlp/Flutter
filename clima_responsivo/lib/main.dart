import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import './pages/home.dart';



void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ClimaResponsivo(),
    ),
  );
}

class ClimaResponsivo extends StatelessWidget {
  const ClimaResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsividade',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const Home(),
    );
  }
}
