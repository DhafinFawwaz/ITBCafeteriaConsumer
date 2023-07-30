import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton ({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        minimumSize: const Size.fromHeight(0),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}