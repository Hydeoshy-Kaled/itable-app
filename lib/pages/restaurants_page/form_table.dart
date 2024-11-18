import 'package:flutter/material.dart';



class ReserveTable extends StatelessWidget {
  const ReserveTable({super.key});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve a Table'),
      ),
      body: const Center(
        child: Text('Reserve your table here'),
      ),
    );
  }
}