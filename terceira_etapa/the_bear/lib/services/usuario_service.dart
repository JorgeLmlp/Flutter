import '../database/database_helper.dart';
import '../models/usuario_model.dart';

class UsuarioService {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<int> cadastrarUsuario(Usuario usuario) async {
    final db = await dbHelper.database;

    return await db.insert(
      'usuario',
      usuario.toMap(),
    );
  }

  Future<Usuario?> login(String email, String senha) async {
    final db = await dbHelper.database;

    final resultado = await db.query(
      'usuario',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    if (resultado.isEmpty) {
      return null;
    }

    return Usuario.fromMap(resultado.first);
  }

  Future<List<Usuario>> listarUsuarios() async {
    final db = await dbHelper.database;

    final resultado = await db.query('usuario');

    return resultado.map((item) => Usuario.fromMap(item)).toList();
  }

  Future<int> excluirUsuario(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'usuario',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> atualizarUsuario(Usuario usuario) async {
    final db = await dbHelper.database;

    return await db.update(
      'usuario',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }
}
