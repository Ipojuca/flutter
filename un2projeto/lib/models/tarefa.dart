import 'dart:convert';

//import 'usuario.dart';

Tarefa tarefaFromJson(String str) => Tarefa.fromJson(json.decode(str));

String tarefaToJson(Tarefa data) => json.encode(data.toJson());

class Tarefa {
  Tarefa(
      {required this.id,
      required this.projetoId,
      required this.descricao,
      //required this.usuario,
      required this.usuarioId});

  int id;
  int projetoId;
  String descricao;
  int usuarioId;
  //Usuario usuario;

  factory Tarefa.fromJson(Map<String, dynamic> json) => Tarefa(
        id: json["id"],
        projetoId: json["projetoId"],
        descricao: json["descricao"],
        usuarioId: json["usuarioId"],
        //usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projetoId": projetoId,
        "descricao": descricao,
        "usuarioId": usuarioId,
        //"usuario": usuario.toJson(),
      };
}
