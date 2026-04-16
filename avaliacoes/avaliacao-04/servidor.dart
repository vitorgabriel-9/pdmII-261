import 'dart:io';
import 'dart:convert';

void main() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 4040);

  print('Servidor rodando em ${server.address.address}:${server.port}');

  // Escuta conexões de clientes
  await for (Socket client in server) {
    print('Cliente conectado: ${client.remoteAddress.address}');

    // Escuta dados do cliente
    client.listen(
      (data) {
        String mensagem = utf8.decode(data);
        print('Temperatura recebida: $mensagem °C');
      },
      onDone: () {
        print('Cliente desconectado');
        client.close();
      },
      onError: (error) {
        print('Erro: $error');
        client.close();
      },
    );
  }
}