import 'package:flutter/material.dart';

import '../models/tarefa.dart';
import '../models/usuario.dart';

class UsuarioItem extends StatelessWidget {
  final Usuario usuario;

  const UsuarioItem(this.usuario);

  /*void _selectPlace(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          AppRoutes.PLACES_DETAIL,
          arguments:
              place, //passar um map com chave valor para passar mais de um argumento
        )
        .then((value) => {
              if (value == null) {} else {print(value)}
            });
  }*/

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            usuario.nome,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
