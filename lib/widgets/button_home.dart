import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFA726),
        minimumSize: const Size(343, 88),
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

