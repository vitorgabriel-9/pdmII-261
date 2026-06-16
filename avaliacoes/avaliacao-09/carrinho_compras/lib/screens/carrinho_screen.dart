import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carrinho_provider.dart';

class CarrinhoScreen extends StatelessWidget {
  const CarrinhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<CarrinhoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carrinho.itens.length,
              itemBuilder: (context, index) {
                final produto =
                    carrinho.itens[index];

                return ListTile(
                  title: Text(produto.nome),
                  subtitle: Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      carrinho.removerProduto(produto);
                    },
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Total: R\$ ${carrinho.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}