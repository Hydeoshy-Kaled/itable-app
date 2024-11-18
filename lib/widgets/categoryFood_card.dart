import 'package:flutter/material.dart';

class CategoryFoodCard extends StatelessWidget {
  final String icon; // Caminho da imagem
  final Color color;
  final String name;
  final String price;
  final void Function()? onTap;

  const CategoryFoodCard({
    required this.icon,
    required this.color,
    required this.name,
    required this.price,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.8), // Fundo com opacidade
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome do restaurante
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Preço no círculo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            // Ícone da categoria
            Center(
              child: Image.asset(
                icon,
                width: 85,
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
