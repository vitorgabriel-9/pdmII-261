import 'dart:io';

void main() async {
  try {
    Socket socket = await Socket.connect('192.168.0.5', 3000);
    print('Conectou!');
    socket.destroy();
  } catch (e) {
    print('Erro: $e');
  }
}