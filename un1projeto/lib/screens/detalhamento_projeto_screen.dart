import 'package:flutter/material.dart';
import 'package:projeto2/components/place_item.dart';
import 'package:projeto2/components/tarefa_item.dart';
import 'package:projeto2/data/my_data.dart';
import 'package:projeto2/models/country.dart';
import 'package:projeto2/models/projeto.dart';

class DetalhamentoProjetoScreen extends StatelessWidget {
  //Country country;
  // CountryPlacesScreen(this.country);

  @override
  Widget build(BuildContext context) {
    /*final country = ModalRoute.of(context)!.settings.arguments as Country;
    
    final countryPlaces = DUMMY_PLACES.where((places) {
      return places.paises.contains(country.id);
    }).toList();*/

    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    
           
    final projetoItem = DUMMY_TAREFAS.where((tarefas) {
      return tarefas.id == projeto.id;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(projeto.descricao),
      ),
      body: ListView.builder(
          //itemCount: countryPlaces.length,
          itemCount: projetoItem.length,
          itemBuilder: (ctx, index) {
            return TarefaItem(projetoItem[index]);
          }
      ),
    );
  }
}