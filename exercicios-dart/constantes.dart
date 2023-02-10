import 'dart:io';
import 'dart:math';

void main() {
  String? texto = stdin.readLineSync();
  print("O valor digitado é: ${texto}");

  final entradaRaio = stdin.readLineSync();
  final raio = double.parse(entradaRaio!);
  final area = pi * (raio * raio);
  print("O valor da área é: ${area}");
}
