import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
   AccountWidget({Key? key, required this.bigText, required this.appIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.height10,
        bottom: Dimensions.height10
      ), child: Row(
      children: [
        appIcon,
        SizedBox(width: Dimensions.width20,),
        bigText,
      ],
    ),
      decoration: BoxDecoration(
        color: CupertinoColors.white
      ),
    );
  }
}
