// ignore_for_file: prefer_const_constructors

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _stateValue; // = 'RN';
  String? _countryValue; // = 'Brasil';

  final List<String> _estados = ["RN", "PB", "CE", "PE"];
  final List<String> _paises = ["Brasil", "Argentina", "Chile", "Uruguai"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // ignore: prefer_const_constructors
              Text(
                'Personal Info',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Birthday', helperText: 'MM/DD/YYYY'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Social Security',
                          helperText: '###-##-####'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                'Residence address',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address'),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'City'),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: DropdownButtonFormField<String>(
                      //itemHeight: 58.0,
                      hint: Text("State"),
                      isExpanded: true,
                      value: _stateValue,
                      onChanged: (String? data) {
                        setState(() {
                          _stateValue = data;
                        });
                      },
                      items: _estados
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Zip Code'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: DropdownButton<String>(
                        itemHeight: 55.0,
                        hint: Text("Country"),
                        value: _countryValue,
                        isExpanded: true,
                        onChanged: (String? data) {
                          setState(() {
                            _countryValue = data;
                          });
                        },
                        items: _paises
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
