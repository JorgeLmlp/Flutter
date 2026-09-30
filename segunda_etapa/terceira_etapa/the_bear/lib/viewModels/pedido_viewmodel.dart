import 'package:flutter/material.dart';

import 'package:the_bear/models/pedido_model.dart';
import 'package:the_bear/services/pedido_service.dart';

class PedidoViewModel extends ChangeNotifier {
  final PedidoService service = PedidoService();

  List<Pedido> pedidos = [];

  bool carregando = false;

  String? erro;

  Future<void> carregarPedidos() async {
    carregando = true;
    erro = null;

    notifyListeners();

    try {
      pedidos = await service.listarPedidos();
    } catch (e) {
      erro = 'Erro ao carregar pedidos';
    }

    carregando = false;

    notifyListeners();
  }

  Future<void> cadastrarPedido({
    required String cliente,
    required String prato,
    required int quantidade,
    required double valorUnitario,
  }) async {
    final pedido = Pedido(
      cliente: cliente,
      prato: prato,
      quantidade: quantidade,
      valorUnitario: valorUnitario,
    );

    await service.cadastrarPedido(pedido);

    await carregarPedidos();
  }

  Future<void> atualizarPedido(
    Pedido pedido,
  ) async {
    await service.atualizarPedido(pedido);

    await carregarPedidos();
  }

  Future<void> finalizarPedido(
    int id,
  ) async {
    await service.finalizarPedido(id);

    await carregarPedidos();
  }

  Future<void> excluirPedido(
    int id,
  ) async {
    await service.excluirPedido(id);

    await carregarPedidos();
  }
}