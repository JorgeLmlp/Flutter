import 'package:the_bear/database/database_helper.dart';
import 'package:the_bear/models/pedido_model.dart';

class PedidoService {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  // CREATE
  Future<int> cadastrarPedido(Pedido pedido) async {
    final db = await dbHelper.database;

    return await db.insert(
      'pedido',
      pedido.toMap(),
    );
  }

  // READ
  Future<List<Pedido>> listarPedidos() async {
    final db = await dbHelper.database;

    final resultado = await db.query(
      'pedido',
      orderBy: 'id DESC',
    );

    return resultado
        .map(
          (item) => Pedido.fromMap(item),
        )
        .toList();
  }

  // READ POR ID
  Future<Pedido?> buscarPedido(int id) async {
    final db = await dbHelper.database;

    final resultado = await db.query(
      'pedido',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (resultado.isEmpty) {
      return null;
    }

    return Pedido.fromMap(
      resultado.first,
    );
  }

  // UPDATE
  Future<int> atualizarPedido(Pedido pedido) async {
    final db = await dbHelper.database;

    final dados = pedido.toMap();

    // Não precisamos alterar o ID.
    dados.remove('id');

    return await db.update(
      'pedido',
      dados,
      where: 'id = ?',
      whereArgs: [pedido.id],
    );
  }

  // FINALIZAR
  Future<int> finalizarPedido(int id) async {
    final db = await dbHelper.database;

    return await db.update(
      'pedido',
      {
        'status': 'Finalizado',
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE
  Future<int> excluirPedido(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'pedido',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}