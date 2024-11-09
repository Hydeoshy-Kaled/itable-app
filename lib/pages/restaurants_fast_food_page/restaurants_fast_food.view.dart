import 'package:flutter/material.dart';

class RestaurantsFastFoodView extends StatelessWidget {
  const RestaurantsFastFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Fast Food'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(
        child: Text('Welcome to Restaurant Fast Food'),
      ),
    );
  }
}
