import 'package:flutter/material.dart';
import 'package:minhalistafilmes/models/filme.dart';

import '../services/lista_filmes_service.dart';

class FilmeViewmodel extends ChangeNotifier {
  final ListaFilmesService service = ListaFilmesService.instance;

  List<Filme> tarefas = [];

  Future<void> carregarTarefas() async {
    tarefas = await service.listarFilmes();

    notifyListeners();
  }

  Future<void> adicionarFilme(String titulo) async {
    // Impede cadastrar um filme vazio
    if (titulo.isEmpty) {
      return;
    }

    final filme = Filme(
      titulo: titulo,
    );

    await service.inserirItem(filme);

    // Depois de salvar, busca novamente os filmes
    await carregarTarefas();
  }

  Future<void> alterarStatus(Filme filme) async {
    // Inverte o status
    filme.assistido = !filme.assistido;

    // Atualiza no banco
    await service.toggleAssistido(
      filme,
      filme.assistido,
    );

    notifyListeners();
  }
}