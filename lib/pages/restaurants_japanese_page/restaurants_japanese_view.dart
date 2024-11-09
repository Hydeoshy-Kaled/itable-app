import 'package:flutter/material.dart';

class RestaurantesJapaneseView extends StatelessWidget {
  const RestaurantesJapaneseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes Japoneses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(
        child: Text('Bem-vindo aos Restaurantes Japoneses!'),
      ),
    );
  }
}
