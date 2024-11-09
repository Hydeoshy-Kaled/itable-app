import 'package:flutter/material.dart';

class RestaurantsMexicanView extends StatelessWidget {
  const RestaurantsMexicanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Mexican'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(
        child: Text('Welcome to Restaurant Mexican'),
      ),
    );
  }
}
