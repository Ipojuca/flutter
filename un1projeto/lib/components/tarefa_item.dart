import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaItem extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaItem(this.tarefa);

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
      color: Color.fromARGB(255, 238, 229, 248),
      child: Column(
        children: <Widget>[
          Text(
            tarefa.descricao,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(tarefa.usuario.nome)
        ],
      ),
    );
  }
}
