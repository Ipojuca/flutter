import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondaryCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Secundário'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Meu Contador Secundário'),
            Consumer(builder: builder)
            Text(
              'Contador: 0',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_box),
      ),
    );
  }
}
