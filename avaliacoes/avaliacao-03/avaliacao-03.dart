import 'dart:convert';

class Dependente {
  String nome;

  Dependente(this.nome);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
    };
  }
}

class Funcionario {
  String nome;
  List<Dependente> dependentes;

  Funcionario(this.nome, this.dependentes);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dependentes': dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  String nomeProjeto;
  List<Funcionario> funcionarios;

  EquipeProjeto(this.nomeProjeto, this.funcionarios);

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': nomeProjeto,
      'funcionarios': funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  var d1 = Dependente('Ana');
  var d2 = Dependente('Carlos');
  var d3 = Dependente('Marina');

  // 2. Criar varios objetos Funcionario e 3. Associar os Dependentes criados aos respectivos funcionários
  var f1 = Funcionario('João', [d1, d2]);
  var f2 = Funcionario('Maria', [d3]);

  // 4. Criar uma lista de Funcionarios (Coleção Lista)
  List<Funcionario> funcionarios = [f1, f2];

  // 5. Criar um objeto Equipe Projeto chamando o metodo contrutor que da nome ao projeto e insere uma coleção de funcionario
  var equipe = EquipeProjeto('Projeto em Dart', funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  String json = jsonEncode(equipe);
  print(json);
}
