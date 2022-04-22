import 'package:flutter/material.dart';

class ImcForm extends StatefulWidget {
  void Function(double, double) onSubmit;
  ImcForm(this.onSubmit, {Key? key}) : super(key: key);
  @override
  State<ImcForm> createState() => _ImcFormState();
}

class _ImcFormState extends State<ImcForm> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  bool _validatePeso = true;
  bool _validateAltura = false;

  _submitForm() {
    setState(() {
      double? peso = double.tryParse(_pesoController.text);
      double? altura = double.tryParse(_alturaController.text);
      _validatePeso = (peso != null);
      _validateAltura = (altura != null);
      if (peso == null || altura == null) {
        return;
      }
      widget.onSubmit(peso, altura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _pesoController,
                decoration: InputDecoration(
                    labelText: 'Peso',
                    errorText: !_validatePeso
                        ? 'Peso não informado ou incorreto'
                        : null),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                  controller: _alturaController,
                  decoration: InputDecoration(
                      labelText: 'Altura',
                      errorText: !_validateAltura
                          ? 'Altura não informada ou incorreta'
                          : null),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.right),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: _submitForm, child: const Text('Confirmar')),
        ),
      ],
    );
  }
}
