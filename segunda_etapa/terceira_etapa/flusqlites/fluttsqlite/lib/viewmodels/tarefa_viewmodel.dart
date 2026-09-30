import 'package:flutter/material.dart';
import 'package:fluttsqlite/models/tarefa.dart';
import '../services/tarefa_service.dart';

class TarefaViewModel extends ChangeNotifier{
  final TarefaService service = TarefaService();
  List<Tarefa> tarefas = [];
  Future<void> carregarTarefas() async {
  tarefas = await service.listarTarefas();

  notifyListeners();
}

Future<void> adicionarTarefa(String titulo) async {
  // Impede cadastrar uma tarefa vazia
  if (titulo.isEmpty) {
    return;
  }

  final tarefa = Tarefa(titulo: titulo);

  await service.inserirTarefas(tarefa);

  // Depois de salvar, busca novamente as tarefas atualizadas
  await carregarTarefas();
}

Future<void> alterarStatus(Tarefa tarefa) async {
  tarefa.concluida = !tarefa.concluida;

  await service.atualizarStatus(tarefa);
}


}