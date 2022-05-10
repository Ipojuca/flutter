import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto2/models/projeto.dart';
import 'package:projeto2/models/screenobj.dart';
import 'package:projeto2/models/usuario.dart';
import 'package:projeto2/utils/app_routes.dart';

import '../data/my_data.dart';

class ProjetosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GridView(
      //   padding: const EdgeInsets.all(25),
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent:
      //         200, //cada elemento com extenso maxima de 200 pixel
      //     childAspectRatio: 3 / 2, //proporcao de cada elemento dentro do grid
      //     crossAxisSpacing: 20, //espacamento no eixo cruzado
      //     mainAxisSpacing: 20, //espacamento no eixo principal
      //   ),
      //   children: DUMMY_PROJETOS.map((projeto) {
      //     return ProjetoItem(projeto);
      //   }).toList(),
      // ),
      child: ListView.builder(
        itemCount: DUMMY_PROJETOS.length, //_projetoLista.length,
        itemBuilder: (context, index) {
          final projeto = DUMMY_PROJETOS[index]; //_projetoLista[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.PROJETO_DETALHE,
                  arguments: projeto);
            },
            child: Card(
              child: Row(
                children: [
                  Text(projeto.titulo),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: projeto.prazo.day >= DateTime.now().day
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(DateFormat('d MMM y').format(projeto.prazo),
                          style: TextStyle(
                              color: projeto.prazo.day >= DateTime.now().day
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
