
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/tarefa.dart';

class TarefaService {
  Future<Database> abrirBanco() async {
    // Descobre onde o dispositivo permite salvar banco de dados
    final caminhoBanco = await getDatabasesPath();

    print("LOCAL DO BANCO $caminhoBanco");

    // Junta a pasta encontrada com o nome do arquivo
    final caminho = join(caminhoBanco, 'tarefas.db');

    print("BANCO COMPLETO: $caminho");

    // Abre o banco de dados
    return openDatabase(
      caminho,

      // Versão atual do banco
      version: 1,

      // Executa quando o banco é criado pela primeira vez
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE tarefas(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            concluida INTEGER NOT NULL
          )
          ''',
        );
      },
    );
  }

  Future<void> inserirTarefas(Tarefa tarefa) async {
    final db = await abrirBanco();

    // Insere no banco de dados
    await db.insert(
      'tarefas',
      {
        'titulo': tarefa.titulo,
        'concluida': tarefa.concluida ? 1 : 0,
      },
    );
  }

  Future<List<Tarefa>> listarTarefas() async {
    // Abre o banco
    final db = await abrirBanco();

    final lista = await db.query('tarefas');

    return lista.map((item) {
      return Tarefa(
        titulo: item['titulo'] as String,
        concluida: item['concluida'] == 1,
      );
    }).toList();
  }

  Future<void> atualizarStatus(Tarefa tarefa) async {
    final db = await abrirBanco();

    // Atualiza um registro
    await db.update(
      // Nome da tabela
      'tarefas',
      {
        'concluida': tarefa.concluida ? 1 : 0,
      },

      // Definindo qual registro será atualizado
      where: 'id = ?',

      // Id da tarefa que será alterado
      whereArgs: [
        tarefa.id,
      ],
    );
  }
}