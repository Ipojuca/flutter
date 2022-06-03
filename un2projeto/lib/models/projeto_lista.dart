import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'projeto2.dart';

class ProjetoLista with ChangeNotifier {
  final _baseUrl = 'https://dispmoveis-b359b-default-rtdb.firebaseio.com/';
  final List<Projeto2> _projetos = <Projeto2>[];

  List<Projeto2> get projetos {
    //TODO: pegar na nuvem
    return [..._projetos];
  }

  Future<void> addProjeto(Projeto2 projeto) {
    final future = http.post(Uri.parse('$_baseUrl/projetos.json'),
        body: jsonEncode({
          "id": 1,
          "titulo": projeto.titulo,
          "prazo": projeto.prazo,
          "descricao": projeto.descricao,
        }));
    return future.then((response) {
      print(jsonDecode(response.body));
      final id = jsonDecode(response.body)['name'];
      print(response.statusCode);
      projeto.Set_id(id);
      _projetos.add(projeto);
      notifyListeners();
    });
    //TODO: savar na nuvem
    _projetos.add(projeto);
    notifyListeners();
  }
  //TODO: delete
  //TODO: update

}
