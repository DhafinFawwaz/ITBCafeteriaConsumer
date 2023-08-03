import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

import 'floating_back_button.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key, required this.hoveringChild, required this.child});

  final Widget hoveringChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: GlobalTheme.padding1, right: GlobalTheme.padding1),
            child: hoveringChild,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180, bottom: 80),
            child: child,
          ),
          Positioned(
            top: 20,
            left: 10,
            child: FloatingBackButton(Colors.black),
          ),
        ],
      )
    );
  }
}