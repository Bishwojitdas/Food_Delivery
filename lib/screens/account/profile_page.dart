import 'package:flutter/material.dart';
import 'package:food_delivery/screens/account/account_widget.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Profile", color: Colors.white, size: Dimensions.font26,),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.height45+Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  //Name
                  AccountWidget(
                    appIcon: AppIcon(icon: Icons.person,
                      backgroundColor: Colors.deepPurple,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                    bigText: BigText(text: "Bishwojit Chandra Das", color: Colors.black,),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //Phone
                  AccountWidget(
                    appIcon: AppIcon(icon: Icons.call,
                      backgroundColor: Colors.green,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                    bigText: BigText(text: "01868690289", color: Colors.black,),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //Email
                  AccountWidget(
                    appIcon: AppIcon(icon: Icons.mail,
                      backgroundColor: Colors.brown,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                    bigText: BigText(text: "bishwoji88@gmail.com", color: Colors.black,),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //Address
                  AccountWidget(
                    appIcon: AppIcon(icon: Icons.location_on,
                      backgroundColor: Colors.red,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                    bigText: BigText(text: "North chandpur, lemua, feni", color: Colors.black,),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //Message
                  AccountWidget(
                    appIcon: AppIcon(icon: Icons.message,
                      backgroundColor: Colors.blue,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height10*5/2,
                      size: Dimensions.height10*5,),
                    bigText: BigText(text: "Hi Bishwojit! I am here..." ,color: Colors.black,),
                  ),
                  SizedBox(height: Dimensions.height10,),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
