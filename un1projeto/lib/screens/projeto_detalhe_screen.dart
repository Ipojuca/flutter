import 'package:flutter/material.dart';
import 'package:projeto2/models/tarefa.dart';

import '../components/tarefa_item.dart';
import '../data/my_data.dart';
import '../models/projeto.dart';
import '../utils/app_routes.dart';

class ProjetoDetalheScreen extends StatefulWidget {
  @override
  State<ProjetoDetalheScreen> createState() => _ProjetoDetalheScreenState();
}

class _ProjetoDetalheScreenState extends State<ProjetoDetalheScreen> {
  //Country country;
  @override
  Widget build(BuildContext context) {
    /*final country = ModalRoute.of(context)!.settings.arguments as Country;
    
    final countryPlaces = DUMMY_PLACES.where((places) {
      return places.paises.contains(country.id);
    }).toList();*/

    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    //Projeto projeto = parametros[0];

    List<Tarefa> tarefaItem = DUMMY_TAREFAS.where((tarefas) {
      return tarefas.id == projeto.id;
    }).toList();

    cadastrarTarefa() async {
      var result = await Navigator.pushNamed(context, AppRoutes.TAREFA_CADASTRO,
          arguments: projeto);

      setState(() {
        DUMMY_TAREFAS.add(result as Tarefa);
        tarefaItem = DUMMY_TAREFAS.where((tarefas) {
          return tarefas.id == projeto.id;
        }).toList();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(projeto.titulo),
      ),
      body: /* ListView.builder(
          //itemCount: countryPlaces.length,
          itemCount: tarefaItem.length,
          itemBuilder: (ctx, index) {
            return TarefaItem(tarefaItem[index]);
          }*/
          Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(projeto.descricao),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  //itemCount: countryPlaces.length,
                  itemCount: tarefaItem.length,
                  itemBuilder: (ctx, index) {
                    return TarefaItem(tarefaItem[index]);
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: cadastrarTarefa, child: Text('Cadastrar Tarefa'))
          ],
        ),
      ),
    );
  }
}
