import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;

  const SearchBar({super.key, this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: 'Dishes, restaurants, or cuisines',
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF656F77),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
