import 'dart:math';
import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../models/projeto.dart';

class UsuarioCadastroScreen extends StatefulWidget {
  //void Function(Projeto) onSubmit;
  //final Projeto projeto;
  @override
  //State<ProjetoCadastroScreen> createState() => _ProjetoCadastroScreenState();
  State<UsuarioCadastroScreen> createState() => _UsuarioCadastroScreenState();
}

class _UsuarioCadastroScreenState extends State<UsuarioCadastroScreen> {
  final _usuarioControllerNome = TextEditingController();
  final _usuarioControllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            color: Color.fromARGB(255, 238, 229, 248),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usuarioControllerNome,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usuarioControllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ]),
          ),
          Divider(
            height: 20,
          ),
          ElevatedButton(
              onPressed: salvarUsuario,
              child: Text(
                'Salvar',
              ))
        ],
      ),
    );
  }

  salvarUsuario() {
    Usuario novoUsuario = Usuario(
        id: Random().nextInt(9999),
        nome: _usuarioControllerNome.text,
        email: _usuarioControllerEmail.text);
    Navigator.pop(context, novoUsuario);
  }
}
