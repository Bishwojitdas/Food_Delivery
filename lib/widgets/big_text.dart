import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   BigText({Key? key,required this.text,  this.color=Colors.cyan,this.size=0,
     this.overflow=TextOverflow.ellipsis, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: size==0?Dimensions.font20:size,
          color: color,
          fontWeight: FontWeight.w400
        ),
    );
  }
}
