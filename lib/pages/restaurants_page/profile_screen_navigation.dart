import 'package:flutter/material.dart';

class ProfileScreenNavigation extends StatelessWidget {
  const ProfileScreenNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Welcome to Profile Screen Navigation'),
      ),
    );
  }
}
