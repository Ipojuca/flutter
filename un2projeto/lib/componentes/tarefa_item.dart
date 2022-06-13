import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un2projeto/controller/tarefacontroller.dart';

import '../models/tarefa.dart';

class TarefaItem extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaItem(this.tarefa);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(tarefa.descricao),
          subtitle: Text(tarefa.usuarioId.toString()),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Color.fromARGB(255, 238, 229, 248), width: 1),
              borderRadius: BorderRadius.circular(5)),
          tileColor: const Color.fromARGB(255, 238, 229, 248),
          trailing: SizedBox(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      // updateTarefa(tarefa);
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.orange,
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<TarefaController>(context, listen: false)
                          .deleteTarefa(tarefa);
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              )),
          // onTap: () {
          //   setState(() {
          //     _usuario = globals.listaUsuariosGlobal[index];
          //   });
          // },
        ),
      ],
    );
  }
}
