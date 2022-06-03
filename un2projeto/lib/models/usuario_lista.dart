import 'package:flutter/cupertino.dart';

import 'usuario2.dart';

class UsuarioLista with ChangeNotifier {
  final List<Usuario2> _usuarios = <Usuario2>[];

  List<Usuario2> get usuarios {
    //TODO: pegar na nuvem
    return [..._usuarios];
  }

  void addProjeto(Usuario2 usuario) {
    //TODO: savar na nuvem
    _usuarios.add(usuario);
    notifyListeners();
  }
  //TODO: delete
  //TODO: update
}
