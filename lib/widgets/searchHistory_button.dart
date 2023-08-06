import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

class searchHistoryButton extends StatelessWidget {
  const searchHistoryButton ({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, GlobalTheme.padding2, 0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: Color.fromRGBO(218, 218, 218, 1),
          ),
          shadowColor: Colors.transparent,
          backgroundColor: Color.fromRGBO(243, 243, 243, 1), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ).copyWith(
            elevation: ButtonStyleButton.allOrNull(0.0)
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.orange,
            fontSize: GlobalTheme.fontsize3, 
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}