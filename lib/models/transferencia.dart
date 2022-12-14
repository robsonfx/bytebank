import 'package:flutter/material.dart';

@immutable
class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia(
    this.valor,
    this.numeroConta,
  );

  @override
  String toString() {
    return 'TransferĂȘncia {valor: $valor, numeroConta: $numeroConta}';
  }
}
