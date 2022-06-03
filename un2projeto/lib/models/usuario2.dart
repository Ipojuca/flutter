import 'package:flutter/cupertino.dart';

class Usuario2 extends ChangeNotifier {
  int id;
  String nome;
  String email;

  Usuario2({required this.id, required this.nome, required this.email});
}
