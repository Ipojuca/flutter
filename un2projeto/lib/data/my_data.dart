import 'package:flutter/material.dart';
import '../models/projeto.dart';
import '../models/tarefa.dart';
import '../models/usuario.dart';

List<Projeto> DUMMY_PROJETOS = [
  Projeto(
      id: 1,
      titulo: 'projeto1',
      prazo: DateTime.now(),
      descricao: 'descricao do projeto'),
  Projeto(
      id: 2,
      titulo: 'projeto2',
      prazo: DateTime.now(),
      descricao: 'descricao do projeto'),
];

List<Tarefa> DUMMY_TAREFAS = [
  Tarefa(id: 1, descricao: 'tarefa1_1', usuario: DUMMY_USUARIOS[0]),
  Tarefa(id: 1, descricao: 'tarefa1_2', usuario: DUMMY_USUARIOS[1]),
  Tarefa(id: 2, descricao: 'tarefa2', usuario: DUMMY_USUARIOS[2]),
];

List<Usuario> DUMMY_USUARIOS = [
  Usuario(id: 1, nome: 'joao', email: 'joao@email'),
  Usuario(id: 2, nome: 'juca', email: 'juca@email'),
  Usuario(id: 2, nome: 'maria', email: 'maria@email')
];
