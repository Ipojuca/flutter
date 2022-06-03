import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Place with ChangeNotifier {
  final String id;
  final List<String> paises;
  final String titulo;
  final String imagemUrl;
  final List<String> recomendacoes;
  final double avaliacao;
  final double custoMedio;
  bool favorito;

  Place(
      {required this.id,
      required this.paises,
      required this.titulo,
      required this.imagemUrl,
      required this.recomendacoes,
      required this.avaliacao,
      required this.custoMedio,
      this.favorito = false});

  void toggleFavorito() {
    favorito = !favorito;
    notifyListeners();
  }
}
