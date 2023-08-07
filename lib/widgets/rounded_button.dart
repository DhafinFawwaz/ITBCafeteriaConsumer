import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton ({super.key, required this.text, required this.borderRadius, this.backgroundColor = GlobalTheme.slate700, this.textColor = Colors.white, required this.onPressed, this.height = 18});

  final String text;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final double height;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Container(
        height: height,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: textColor
            ),
          ),
        ),
      ),
    );
  }
}