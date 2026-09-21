import 'package:sqflite/sqflite.dart';
import 'package:path/path.h';

class DatabaseHelper {
  // Padrão Singleton para garantir que exista apenas uma instância do banco
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Getter que inicializa ou retorna o banco de dados existente
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('midias.db');
    return _database!;
  }

  // Define o caminho no aparelho e abre o banco
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Cria a tabela com os campos que você definiu
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE itens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        assistido INTEGER NOT NULL
      )
    ''');
  }

  // --- MÉTODOS DE GERENCIAMENTO (CRUD) ---

  // Salvar no banco (Insere 0 para Não Assistido e 1 para Assistido)
  Future<int> insertItem(String titulo) async {
    final db = await instance.database;
    return await db.insert('itens', {
      'titulo': titulo,
      'assistido': 0, // Começa como não assistido
    });
  }

  // Buscar todos os itens do banco
  Future<List<Map<String, dynamic>>> queryAllItems() async {
    final db = await instance.database;
    return await db.query('itens');
  }

  // Alternar o status de assistido (Update)
  Future<int> toggleAssistido(int id, bool foiAssistido) async {
    final db = await instance.database;
    return await db.update(
      'itens',
      {'assistido': foiAssistido ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletar do banco
  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db.delete(
      'itens',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}