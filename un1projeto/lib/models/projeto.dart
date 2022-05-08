import 'package:projeto2/models/tarefa.dart';

class Projeto {
  int id;
  String titulo;
  DateTime prazo;
  String descricao;
  List<Tarefa> tarefas = [];

  Projeto({required this.id, required this.titulo, required this.prazo, required this.descricao});
}