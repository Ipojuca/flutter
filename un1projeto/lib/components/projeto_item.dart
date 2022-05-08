import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/projeto.dart';
import '../utils/app_routes.dart';

class ProjetoItem extends StatelessWidget {
  final Projeto projeto;

  const ProjetoItem(this.projeto);

  void _selectedProjeto(BuildContext context) {
    Navigator.of(context).pushNamed(
      //AppRoutes.COUNTRY_PLACES,
      AppRoutes.PROJETO_DETALHE,
      //arguments: country,
      arguments: projeto,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedProjeto(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          projeto.titulo,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          /*gradient: LinearGradient(
                colors: [
                  country.color.withOpacity(0.5), //cor passad com opacidade
                  country.color, //cor passada
                ],
                begin: Alignment.topLeft, //inicio do gradiente
                end: Alignment.bottomRight // fim
                )*/
        ),
      ),
    );
  }
}
