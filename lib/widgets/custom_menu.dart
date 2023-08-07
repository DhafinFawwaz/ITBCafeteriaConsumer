import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

import 'floating_back_button.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key, required this.hoveringChild, required this.child, this.topHoverHeight = 180, this.bottomHoverHeight = 80, this.hasBackButton = true});

  final double topHoverHeight;
  final double bottomHoverHeight;

  final Widget hoveringChild;
  final Widget child;

  final bool hasBackButton;

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
            padding: EdgeInsets.only(top: topHoverHeight, bottom: bottomHoverHeight),
            child: child,
          ),
          hasBackButton ? 
          Positioned(
            top: 20,
            left: 10,
            child: FloatingBackButton(Colors.black),
          )
          :
          Container()
          ,
        ],
      )
    );
  }
}