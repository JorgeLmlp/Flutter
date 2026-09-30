import 'package:minhalistafilmes/models/filme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaFilmesService {
  static final ListaFilmesService instance = ListaFilmesService._init();
  static Database? _database;

  ListaFilmesService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('lista_filmes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE filmes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        assistido BOOL NOT NULL
      )
    ''');
  }


  Future<int> inserirItem(Filme filme) async {
    final db = await instance.database;
    return await db.insert('filmes', {
      'titulo': filme.titulo,
      'assistido': filme.assistido, // Começa como não assistido
    });
  }

  // Buscar todos os itens do banco
  Future<List<Filme>> listarFilmes() async {
  final db = await instance.database;

  final resultado = await db.query('filmes');

  return resultado.map((item) {
    return Filme(
      id: item['id'] as int,
      titulo: item['titulo'] as String,
      assistido: item['assistido'] == 1,
    );
  }).toList();
}

  // Alternar o status de assistido (Update)
  Future<int> toggleAssistido(Filme filme, bool foiAssistido) async {
    final db = await instance.database;
    return await db.update(
      'filmes',
      {'assistido': foiAssistido ? 1 : 0},
      where: 'id = ?',
      whereArgs: [filme.id],
    );
  }

  // Deletar do banco
  Future<int> deletarFilme(Filme filme) async {
  final db = await openDatabase('../');

  return await db.delete(
    'filmes',
    where: 'id = ?',
    whereArgs: [filme.id],
  );
}
}