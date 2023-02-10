import '../modelo/carro.dart';

void main() {
  var hb20 = Carro(160);

  while (!hb20.estaNoLimite()) {
    print("A velocidade atual é de: ${hb20.acelerar()}km/h.");
  }

  print("Você está no limite de velocidade de: ${hb20.velocidadeAtual}km/h.");
}
