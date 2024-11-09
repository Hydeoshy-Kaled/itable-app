import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final double rating;
  final String cuisine;
  final String? imagePath;
  final IconData? icon;
  final Color color;
  final void Function()? onTap;

  const MenuCard(
      {required this.title,
      required this.rating,
      required this.cuisine,
      this.icon,
      this.imagePath,
      required this.color,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 236,
        width: 200,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 109,
                height: 85,
                fit: BoxFit.contain,
              )
            else
              Icon(
                icon,
                color: color,
                size: 40,
              ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '$rating ★  $cuisine',
              style: TextStyle(color: Colors.grey[700]),
            )
            
          ],
        ),
      ),
    );
  }
}
