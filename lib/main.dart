import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

//MaterialApp funciona como um container inicial para o Materel.
void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          backgroundColor: Colors.white,
        ).copyWith(secondary: Colors.green[700]),
      ),
      home: ListaTransferencias(),
    );
  }
}
