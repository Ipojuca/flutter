import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/my_data.dart';
import '../utils/app_routes.dart';

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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 4,
              margin: const EdgeInsets.all(10),
              color: Color.fromARGB(255, 238, 229, 248),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    projeto.titulo,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    projeto.descricao,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
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
                    child: Text(
                      DateFormat('dd/MMM/yyyy').format(projeto.prazo),
                      style: TextStyle(
                          color: projeto.prazo.day >= DateTime.now().day
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
