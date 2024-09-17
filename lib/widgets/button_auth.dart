import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFA726),
        minimumSize: const Size(184, 25),
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