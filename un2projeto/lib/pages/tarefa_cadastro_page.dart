import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un2projeto/controller/tarefacontroller.dart';
import 'package:un2projeto/controller/usuariocontroller.dart';
import '../models/tarefa.dart';
import '../models/usuario.dart';
import '../models/projeto.dart';

class TarefaCadastroPage extends StatefulWidget {
  //void Function(Projeto) onSubmit;
  //final Projeto projeto;
  @override
  //State<ProjetoCadastroScreen> createState() => _ProjetoCadastroScreenState();
  State<TarefaCadastroPage> createState() => _TarefaCadastroPageState();
}

class _TarefaCadastroPageState extends State<TarefaCadastroPage> {
  final _tarefaControllerDescricao = TextEditingController();

  Usuario _usuario = Usuario(id: 0, nome: '', email: '');
  _selecionarUsuario() {
    // setState(() {
    //   usuarioSelecionado = globals.listaUsuariosGlobal[3];
    // });
  }

  @override
  Widget build(BuildContext context) {
    final _UsuarioController = Provider.of<UsuarioController>(context);
    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Tarefa'),
      ),
      body: Column(children: <Widget>[
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 238, 229, 248),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _tarefaControllerDescricao,
                  decoration: const InputDecoration(
                    labelText: 'Descricao da tarefa',
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ])),
        const Divider(
          height: 20,
        ),
        /*TextField(
          controller: _tarefaControllerDescricao,
          decoration: InputDecoration(labelText: 'Descricao da tarefa'),
        ),*/

        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: Color.fromARGB(255, 238, 229, 248),
            child: const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Atribua um usuario a tarefa:'))),

        Expanded(
          child: SizedBox(
            height: 200.0,
            child: GestureDetector(
              onTap: () {
                //setar o usuario da lista a tarefa
                _selecionarUsuario;
              },
              child: ListView.builder(
                //itemCount: usuarioItem.length,
                //itemCount: DUMMY_USUARIOS.length,
                itemCount: _UsuarioController.usuarios.length,
                itemBuilder: (ctx, index) {
                  //return UsuarioItem(usuarioItem[index]);
                  //return UsuarioItem(DUMMY_USUARIOS[index]);
                  //return UsuarioItem(globals.listaUsuariosGlobal[index]);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child:
                              Text('${_UsuarioController.usuarios[index].id}'),
                        ),
                        title: Text(_UsuarioController.usuarios[index].nome),
                        subtitle:
                            Text(_UsuarioController.usuarios[index].email),
                        onTap: () {
                          setState(() {
                            _usuario = _UsuarioController.usuarios[index];
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        //pegar o usuario que foi clicado
        Text('Usuario selecionado: ' + _usuario.nome),

        ElevatedButton(
            onPressed: () => salvarTarefa(projeto.id, _usuario),
            child: const Text('Salvar'))
      ]),
    );
  }

  salvarTarefa(int id, Usuario _usuario) {
    Tarefa novaTarefa = Tarefa(
        id: 0,
        descricao: _tarefaControllerDescricao.text,
        usuarioId: _usuario.id,
        projetoId: id
        // usuario: globals.listaUsuariosGlobal[
        //     globals.listaUsuariosGlobal.length -
        //         1] //pegar o usuario que foi clicado
        );
    Provider.of<TarefaController>(context, listen: false).addTarefa(novaTarefa);
    Navigator.pop(context, novaTarefa);
  }
}
