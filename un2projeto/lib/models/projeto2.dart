import 'package:flutter/cupertino.dart';

import 'tarefa.dart';

class Projeto2 extends ChangeNotifier {
  String id;
  String titulo;
  DateTime prazo;
  String descricao;
  List<Tarefa> tarefas = [];

  Projeto2(
      {required this.id,
      required this.titulo,
      required this.prazo,
      required this.descricao});

  void Set_id(String id) => this.id = id;
}
