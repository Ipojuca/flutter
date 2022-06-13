import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../controller/projetocontroller.dart';
import '../utils/app_routes.dart';

class ProjetosListView extends StatefulWidget {
  const ProjetosListView({Key? key}) : super(key: key);

  @override
  State<ProjetosListView> createState() => _ProjetosListViewState();
}

class _ProjetosListViewState extends State<ProjetosListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ProjetoController>(context, listen: false);
    //final _controller = context.watch<UsuarioController>();

    _controller.start();
    // switch (_controller.state.value) {
    //   case ProjetoState.error:
    //     return const Center(child: Text('Erro não carregou'));
    //   case ProjetoState.loading:
    //     return const Center(child: Text('loading não carregou'));
    //   case ProjetoState.start:
    //     return const Center(child: Text('start não carregou'));
    //   default:
    // }
    return ListView.builder(
      itemCount: _controller.projetos.length,
      itemBuilder: (context, index) {
        final projeto = _controller.projetos[index]; //_projetoLista[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.PROJETO_DETALHE,
                arguments: projeto);
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 238, 229, 248),
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
                            : Theme.of(context).colorScheme.primary),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    DateFormat('dd/MMM/yyyy').format(projeto.prazo),
                    style: TextStyle(
                        color: projeto.prazo.day >= DateTime.now().day
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
