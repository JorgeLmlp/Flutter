import 'package:flutter/material.dart';
import '../models/usuario_model.dart';
import '../services/usuario_service.dart';

class CadastroViewModel extends ChangeNotifier {
  final UsuarioService service = UsuarioService();

  bool carregando = false;
  String? erro;

  Future<bool> cadastrar(
    String nome,
    String email,
    String senha,
  ) async {
    carregando = true;
    erro = null;
    notifyListeners();

    try {
      final usuario = Usuario(
        nome: nome,
        email: email,
        senha: senha,
      );

      await service.cadastrarUsuario(usuario);

      carregando = false;
      notifyListeners();

      return true;
    } catch (e) {
      carregando = false;
      erro = 'Erro ao cadastrar usuário';
      notifyListeners();

      return false;
    }
  }
}
