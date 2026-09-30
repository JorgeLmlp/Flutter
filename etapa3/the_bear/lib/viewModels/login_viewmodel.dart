import 'package:flutter/material.dart';
import '../models/usuario_model.dart';
import '../services/usuario_service.dart';

class LoginViewModel extends ChangeNotifier {
  final UsuarioService service = UsuarioService();

  bool carregando = false;
  String? erro;

  Future<Usuario?> entrar(String email, String senha) async {
    carregando = true;
    erro = null;
    notifyListeners();

    final usuario = await service.login(email, senha);

    carregando = false;

    if (usuario == null) {
      erro = 'E-mail ou senha inválidos';
    }

    notifyListeners();

    return usuario;
  }
}
