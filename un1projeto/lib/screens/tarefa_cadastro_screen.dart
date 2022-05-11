import 'package:flutter/material.dart';
import 'package:projeto2/data/my_data.dart';
import '../components/usuario_item.dart';
import '../models/tarefa.dart';
import '../models/usuario.dart';
import '../models/projeto.dart';
import '../data/globals.dart' as globals;

class TarefaCadastroScreen extends StatefulWidget {
  //void Function(Projeto) onSubmit;
  //final Projeto projeto;
  @override
  //State<ProjetoCadastroScreen> createState() => _ProjetoCadastroScreenState();
  State<TarefaCadastroScreen> createState() => _TarefaCadastroScreenState();
}

class _TarefaCadastroScreenState extends State<TarefaCadastroScreen> {
  final _tarefaControllerDescricao = TextEditingController();

  Usuario _usuario = Usuario(id: 0, nome: '', email: '');
  _selecionarUsuario() {
    // setState(() {
    //   usuarioSelecionado = globals.listaUsuariosGlobal[3];
    // });
  }

  @override
  Widget build(BuildContext context) {
    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Tarefa'),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: _tarefaControllerDescricao,
          decoration: InputDecoration(labelText: 'Descricao da tarefa'),
        ),
        Text('Atribua um usuario a tarefa:'),

        Expanded(
          child: SizedBox(
            height: 200.0,
            child: GestureDetector(
              onTap: () {
                //setar o usuario da lista a tarefa
                _selecionarUsuario;
                print('clicou');
              },
              child: ListView.builder(
                //itemCount: usuarioItem.length,
                //itemCount: DUMMY_USUARIOS.length,
                itemCount: globals.listaUsuariosGlobal.length,
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
                          child: Text('${index + 1}'),
                        ),
                        title: Text(globals.listaUsuariosGlobal[index].nome),
                        subtitle:
                            Text(globals.listaUsuariosGlobal[index].email),
                        onTap: () {
                          setState(() {
                            _usuario = globals.listaUsuariosGlobal[index];
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
            child: Text('Salvar'))
      ]),
    );
  }

  salvarTarefa(int id, Usuario _usuarioId) {
    Tarefa novaTarefa = Tarefa(
        id: id, descricao: _tarefaControllerDescricao.text, usuario: _usuario
        // usuario: globals.listaUsuariosGlobal[
        //     globals.listaUsuariosGlobal.length -
        //         1] //pegar o usuario que foi clicado
        );
    Navigator.pop(context, novaTarefa);
  }
}
