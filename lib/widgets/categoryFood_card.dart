import 'package:flutter/material.dart';

class CategoryFoodCard extends StatelessWidget {
  final String icon;
  final Color color;
  final String? name;
  final String? price;
  final void Function()? onTap;
  const CategoryFoodCard({
    required this.icon,
    required this.color,
    this.name,
    this.price,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 103.67,
        height: 64,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(
              name?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price?? '',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
