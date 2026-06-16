import 'package:flutter/material.dart';

import '../models/produtos.dart';
import '../widgets/produto_card.dart';
import 'carrinho_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final produtos = [
      Produto(nome: 'Notebook', preco: 3500),
      Produto(nome: 'Mouse', preco: 120),
      Produto(nome: 'Teclado', preco: 250),
      Produto(nome: 'Monitor', preco: 900),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CarrinhoScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ProdutoCard(
            produto: produtos[index],
          );
        },
      ),
    );
  }
}