import 'package:flutter/material.dart';
import '../services/voo_service.dart';

class VooProvider extends ChangeNotifier {
  List<dynamic> voos = [];
  Map<String, dynamic>? vooSelecionado;
  bool carregando = false;

  Future<void> carregarVoos() async {
    carregando = true;
    notifyListeners();

    try {
      voos = await VooService.buscarVoo();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  Future<void> carregarDetalhes({required String tipo, required String categoria}) async {
    carregando = true;
    vooSelecionado = null;
    notifyListeners();

    try {
      vooSelecionado = await VooService.buscarDetalhes(tipo, categoria);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      carregando = false;
      notifyListeners();
    }
  }
}
