import 'dart:io';

void main() async {
  final server = await ServerSocket.bind(
    InternetAddress.anyIPv4,
    3000,
  );

  print('Servidor rodando na porta 3000...');

  await for (Socket cliente in server) {
    print('Cliente conectado: ${cliente.remoteAddress.address}');

    cliente.listen((dados) {
      String mensagem = String.fromCharCodes(dados);
      print('Recebido: $mensagem');
    });
  }
}