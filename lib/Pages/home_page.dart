import 'package:flutter/material.dart';

class MeuAplicativo extends StatefulWidget {
  const MeuAplicativo({super.key});

  @override
  State<MeuAplicativo> createState() => _MeuAplicativoState();
}

class _MeuAplicativoState extends State<MeuAplicativo> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: prefer_final_fields, unused_field
  String _infoText = 'Infome seus dados!';

  // ignore: unused_element
  void _resetFilds() {
    controllerPeso.clear();
    controllerAltura.clear();
    setState(() {
      _infoText = 'Infome seus dados!';
    });
  }

  // ignore: unused_element
  void _calculaIMC() {
    setState(() {
      double peso = double.parse(controllerPeso.text);
      double altura = double.parse(controllerAltura.text) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.6) {
        _infoText = 'Abaixo do peso   Imc = ${imc.toStringAsPrecision(3)} ';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal   Imc = ${imc.toStringAsPrecision(3)} ';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            'Levemente acima do peso   Imc = ${imc.toStringAsPrecision(3)} ';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade grau I   Imc = ${imc.toStringAsPrecision(3)} ';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade grau II   Imc = ${imc.toStringAsPrecision(3)} ';
      } else if (imc >= 40) {
        _infoText = 'Obesidade grau III Imc = ${imc.toStringAsPrecision(3)} ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imc Facil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 59, 199, 255),
        actions: [
          IconButton(onPressed: _resetFilds, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 251, 251, 246),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                TextFormField(
                  controller: controllerPeso,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.cyan),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira seu peso!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: controllerAltura,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle: TextStyle(color: Colors.cyan)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.cyan),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira sua altura!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculaIMC();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: const EdgeInsets.all(16)),
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.cyan),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
