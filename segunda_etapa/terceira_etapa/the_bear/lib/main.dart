import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'database/database_helper.dart';
import 'views/pages/tela_login.dart';

import 'package:the_bear/viewModels/login_viewmodel.dart';
import 'package:the_bear/viewModels/cadastro_viewmodel.dart';
import 'package:the_bear/viewModels/pedido_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('############################');
  print('VERSAO NOVA THE BEAR');
  print('############################');
  // Configuração do SQLite para Web
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }
  await DatabaseHelper.instance.database;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CadastroViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PedidoViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,

        title: 'The Bear',

        theme: ThemeData(
          useMaterial3: true,
        ),

        // Primeira tela do aplicativo
        home: const TelaLogin(),
      ),
    );
  }
}
