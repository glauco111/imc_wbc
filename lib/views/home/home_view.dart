import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc_wbc/views/home/components/text_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController wController = TextEditingController();
  TextEditingController hController = TextEditingController();
  GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  String _infoText = "Informe seus dados!";

  void _resetField() {
    wController.text = "";
    hController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(wController.text);
      double height = double.parse(hController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Magreza (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Normal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9) {
        _infoText = "Obesidade (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetField)
        ],
        backgroundColor: Colors.black,
        title: Text('Calculadora IMC - WBC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              children: [
                CustomTextFormField(
                    controller: hController,
                    labelText: 'Altura em Cm',
                    validateText: 'Insira sua altura'),
                CustomTextFormField(
                    controller: wController,
                    labelText: 'Peso em kg',
                    validateText: 'Insira seu peso'),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        if (_fKey.currentState!.validate()) {
                          _calculate();
                        }
                      },
                      child: Text("Calcular",
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(_infoText,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
