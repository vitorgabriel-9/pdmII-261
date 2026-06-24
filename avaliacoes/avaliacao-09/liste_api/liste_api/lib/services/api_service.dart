import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class ApiService {
  static Future<List<Usuario>> buscarUsuarios() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao carregar usuários');
    }

    final List<dynamic> dados =
        jsonDecode(response.body);

    return dados
        .map((json) => Usuario.fromJson(json))
        .toList();
  }
}