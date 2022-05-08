import 'package:flutter/material.dart';
import 'package:projeto2/data/my_data.dart';
import 'package:projeto2/models/projeto.dart';
import 'package:projeto2/screens/projeto_cadastro.dart';

import '../utils/app_routes.dart';
import 'favoritos_screen.dart';
import 'projetos_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  _novoProjeto(Projeto projeto) {
    setState(() {
      _projetos.add(projeto);
    });
  }

  int _indexSelectedScreen = 0;

  // List<Widget> _screens = [
  //   ProjetosScreen(),
  //   ,
  //   FavoritosScreen()
  // ];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
      switch (index) {
        case 0:
          ProjetosScreen();
          break;
        case 1:
          Navigator.pushNamed(context, AppRoutes.PROJETO_CADASTRO,
              arguments: {'_novoProjeto': _novoProjeto});
          break;
        default:
      }
    });
  }

  List<Projeto> _projetos = DUMMY_PROJETOS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciador de Projetos')),
      body: ProjetosScreen(), // _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Projetos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: 'Cadastrar Projeto'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
        ],
      ),
    );
  }
}
