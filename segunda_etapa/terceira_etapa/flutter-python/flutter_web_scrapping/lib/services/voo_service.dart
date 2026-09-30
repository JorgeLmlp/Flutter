import 'dart:convert';
import 'package:http/http.dart' as http;

class VooService {
  static const String url = 'http://127.0.0';

  static Future<List<dynamic>> buscarVoo() async {
    final resposta = await http.get(Uri.parse(url));

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body);
    }
    throw Exception('Erro ao buscar voos');
  }

  static Future<Map<String, dynamic>> buscarDetalhes(String tipo, String categoria) async {
    
    Uri urlFinal;

    if(categoria == "" && tipo == ""){
      urlFinal = Uri.parse(url);
    }
    else if (categoria.isEmpty && !tipo.isEmpty) {
      urlFinal = Uri.parse("$url?tipo=$tipo");
    } 
    else {
      urlFinal = Uri.parse("$url?tipo=$tipo&categoria=$categoria");
    }


    final resposta = await http.get(urlFinal);

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body);
    }
    throw Exception('Erro ao buscar detalhes do voo');
  }
}