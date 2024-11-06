import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final double rating;
  final String cuisine;
  final IconData icon;
  final Color color;

  const MenuCard(
      {required this.title,
      required this.rating,
      required this.cuisine,
      required this.icon,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$rating ★  $cuisine',
            style: TextStyle(color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
