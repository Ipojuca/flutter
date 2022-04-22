import 'package:flutter/material.dart';

import 'components/ImcForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculo do IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0.0;
  Color cor = Colors.black;
  String _mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ImcForm(_calculaImc),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 150,
                decoration: BoxDecoration(color: cor),
                child: showResult(_mensagem)),
          ],
        ),
      ),
    );
  }

  void _calculaImc(double peso, double altura) {
    _imc = peso / (altura * altura);

    setState(() {
      if (_imc < 18.5) {
        _mensagem = 'Abaixo do Peso';
        cor = Colors.blue;
      } else if (_imc < 25) {
        _mensagem = 'Peso Normal';
        cor = Colors.green;
      } else if (_imc < 30) {
        _mensagem = 'Sobrepeso';
        cor = Color.fromARGB(255, 252, 240, 133);
      } else if (_imc < 35) {
        _mensagem = 'Obesidade Grau I';
        cor = Colors.yellowAccent;
      } else if (_imc < 40) {
        _mensagem = 'Obesidade Grau II';
        cor = Colors.orange;
      } else {
        _mensagem = 'Obesidade Grau III';
        cor = Colors.red;
      }
    });
  }

  Widget showResult(String mensagem) {
    return Center(
        child: Text(
      mensagem,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ));
  }
}
