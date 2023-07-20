import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26, color: Colors.black,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
                children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,
                  size: Dimensions.font15,))

            ),
            SizedBox(width:  Dimensions.width10),
            SmallText(text: "4.5", color: Colors.black54),
            const SizedBox(width: 10,),
            SmallText(text: "1287 comments", color: Colors.black54,),

          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconAndTextWidget(icon: Icons.circle, text: "Normal", color: Colors.black54, iconColor: Colors.orangeAccent),
            SizedBox(width:  Dimensions.width10,),
            const IconAndTextWidget(icon: Icons.location_on, text: "1.7 km", color: Colors.black54, iconColor: Colors.cyanAccent),
            SizedBox(width: Dimensions.width10,),
            const IconAndTextWidget(icon: Icons.watch_later_outlined, text: "32 min", color: Colors.black54, iconColor: Colors.red),
            SizedBox(width:  Dimensions.width10,),
          ],
        )

      ],
    );
  }
}
