import 'package:flutter/material.dart';

class NoDataScreen extends StatelessWidget {
  final String text;
  final String imgPatch;
  const NoDataScreen({Key? key, required this.text,
  this.imgPatch="assets/images/food_table.jpeg"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgPatch,
          height: MediaQuery.of(context).size.height*0.22,
          width: MediaQuery.of(context).size.width*0.22,
        ),
        SizedBox(height:MediaQuery.of(context).size.height*0.23 ,),
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.0175,
            color: Theme.of(context).disabledColor
          ),textAlign: TextAlign.center,
        )

      ],
    );
  }
}
