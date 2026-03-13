// Em Dart, uma pilha é uma estrutura de dados que segue a regra LIFO (Last In, First Out), ou seja: O último elemento que entra é o primeiro que sai.

void main() {
    List<int> pilha = [];
    pilha.add(1);
    pilha.add(2);
    pilha.add(3); // Adicionar elementos na pilha.

    print('Pilha: $pilha');

    int topoPilha = pilha.last; // Buscar o elemento no topo da pilha.
    print('Topo da pilha: $topoPilha');

    pilha.removeLast();
    pilha.removeLast();
    pilha.removeLast(); // Remover o elemento do topo da pilha.
    print('Pilha após remover remover tudo: $pilha');

}
