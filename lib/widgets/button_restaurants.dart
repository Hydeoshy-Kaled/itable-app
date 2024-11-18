import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonRestaurants extends StatelessWidget {
  const ButtonRestaurants({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(400, 10),
        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ), 
      child: Text(
        text,
        style: TextStyle(
          fontFamily: GoogleFonts.raleway().fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ) );
  }
}