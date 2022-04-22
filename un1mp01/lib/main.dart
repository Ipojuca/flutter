import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            novaLinha(),
            novaLinha(),
            novaLinha(),
            novaLinha(),
            novaLinha(),
            novaLinha(),
          ],
        ),
      ),
    );
  }

  Row novaLinha() {
    return Row(children: <Widget>[
      novoQuadrado(),
      novoQuadrado(),
      novoQuadrado(),
      novoQuadrado(),
    ]);
  }

  Container novoQuadrado() {
    double height = (MediaQuery.of(context).size.height / 6);
    double width = (MediaQuery.of(context).size.width / 4);
    return Container(
      height: height,
      width: width,
      color: generateRandomColor(),
    );
  }

// A função generateRandomColor abaixo foi copia do https://coflutter.com/flutter-generate-random-color/
  Color generateRandomColor() {
    Random random = Random();
    // Pick a random number in the range [0.0, 1.0)
    double randomDouble = random.nextDouble();

    return Color((randomDouble * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
