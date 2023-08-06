import 'package:flutter/material.dart';

import '../utils/GlobalTheme.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.icon, required this.headerText, required this.descriptionText, required this.onPressed});

  final IconData icon;
  final String headerText;
  final String descriptionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.only(
            left: GlobalTheme.padding2*2,
            right: GlobalTheme.padding2,
            top: GlobalTheme.padding2,
            bottom: GlobalTheme.padding2,
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: GlobalTheme.padding1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerText,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    descriptionText,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
