import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/projeto2.dart';
import '../models/projeto_lista.dart';
import '../utils/app_routes.dart';
import 'projetos_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  _selectScreen(int index) async {
    switch (index) {
      case 0:
        ProjetosScreen();
        // screenobj _objs = screenobj(projetos: _projetos, usuarios: _usuarios);
        // var result = await Navigator.pushNamed(context, AppRoutes.PROJETO_LISTA,
        //     arguments: _objs);
        break;
      case 1:
        var result =
            await Navigator.pushNamed(context, AppRoutes.PROJETO_CADASTRO);
        // if (result != null) {
        //   _projetos.add(result as Projeto);
        // }
        break;
      case 2:
        var result =
            await Navigator.pushNamed(context, AppRoutes.USUARIO_CADASTRO);
        // if (result != null) {
        //   _usuarios.add(result as Usuario);
        // }
        break;
      default:
    }
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  // List<Projeto> _projetos = DUMMY_PROJETOS;
  // List<Usuario> _usuarios = globals.listaUsuariosGlobal;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProjetoLista>(context);
    final List<Projeto2> _projetos = provider.projetos;

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
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add), label: 'Cadastrar Usuários'),
        ],
      ),
    );
  }
}
