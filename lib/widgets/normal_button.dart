import 'package:flutter/material.dart';

import '../utils/GlobalTheme.dart';

class NormalButton extends StatelessWidget {
  const NormalButton ({
    super.key, required this.text, required this.onPressed,
    this.backgroundColor = GlobalTheme.primaryColor, this.textColor = Colors.white
  });

  final String text;
  final VoidCallback onPressed;

  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor
        ),
      ),
    );
  }
}