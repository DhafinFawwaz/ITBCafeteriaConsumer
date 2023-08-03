import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton ({super.key, required this.text, required this.borderRadius, required this.color, required this.onPressed});

  final String text;
  final BorderRadius borderRadius;
  final Color color;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: color,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}