import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  Color backgroundColor;
  Color iconColor;
  final double size;
  final double iconSize;
   AppIcon({Key? key,
    required this.icon,
    this.backgroundColor=const Color(0xFFfcf4e4),
     this.iconColor=const Color(0xFF756d54),
     this.size=40,
     this.iconSize=16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(icon,
        size: iconSize,
        color: iconColor,),

    );
  }
}
