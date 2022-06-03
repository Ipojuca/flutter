import 'package:flutter/cupertino.dart';

import 'usuario.dart';

class Tarefa extends ChangeNotifier {
  int id;
  String descricao;
  Usuario usuario;
  bool finalizado = false;

  Tarefa({required this.id, required this.descricao, required this.usuario});
}
