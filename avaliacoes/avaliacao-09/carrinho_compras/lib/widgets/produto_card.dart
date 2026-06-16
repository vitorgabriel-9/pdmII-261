import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produtos.dart';
import '../providers/carrinho_provider.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;

  const ProdutoCard({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Text(
          'R\$ ${produto.preco.toStringAsFixed(2)}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            context
                .read<CarrinhoProvider>()
                .adicionarProduto(produto);
          },
        ),
      ),
    );
  }
}