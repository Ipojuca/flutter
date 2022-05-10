import 'package:flutter/material.dart';
import 'screens/projeto_cadastro.dart';
import 'screens/projeto_detalhe_screen.dart';

import 'screens/countries_places_screen.dart';
import 'screens/place_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/tarefa_cadastro_screen.dart';
import 'screens/usuario_cadastro_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Projetos',
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.fromARGB(255, 80, 29, 161),
              secondary: Color.fromARGB(255, 245, 245, 48)),
          //primarySwatch: Colors.purple,
          //accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
        AppRoutes.PLACES_DETAIL: (ctx) => PlaceDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
        AppRoutes.PROJETO_DETALHE: (ctx) => ProjetoDetalheScreen(),
        AppRoutes.PROJETO_CADASTRO: (ctx) => ProjetoCadastroScreen(),
        AppRoutes.USUARIO_CADASTRO: (ctx) => UsuarioCadastroScreen(),
        AppRoutes.TAREFA_CADASTRO: (ctx) => TarefaCadastroScreen(),
      },
    );
  }
}
