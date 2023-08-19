import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/screens/sign_up/sign_up_page.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var _formKey=GlobalKey<FormState>();

   // final _emailController=TextEditingController();
    final _passController=TextEditingController();
    final _userNameController=TextEditingController();

    void _login(AuthController authController){
     // String email=_emailController.text.trim();
      String password=_passController.text.trim();
      String uName=_userNameController.text.trim();
      /*if(email.isEmpty){
        showCustomSnackbar("Type your email address", title: "Email Address");
      }
     else if(!GetUtils.isEmail(email)){
        showCustomSnackbar("Type in a valid email address", title: "Valid Email Address");
      }*/
      if(uName.isEmpty){
        showCustomSnackbar("Type your uName", title: "User Name");
      }
     else if(password.isEmpty){
        showCustomSnackbar("Type your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackbar("Password cannot be less than six characters", title: "Pasword");
      }else{
        authController.login(uName, password).then((status) {
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
            print("Login Success");

          }else{
            showCustomSnackbar(status.message);
          }
        });
      }
    }


    return Scaffold(
      body:GetBuilder<AuthController>(builder: (authController) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              //app logo
              Container(
                height: Dimensions.screenHeight*0.25,
                child:const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/sign_up_1.jpg"),
                  ),
                ),
              ),
              //welcome
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Hello", style: TextStyle(
                        fontSize: Dimensions.font20*2+Dimensions.font15*2, fontWeight: FontWeight.bold ),),
                    Text("Sign into your account", style: TextStyle(
                        fontSize: Dimensions.font15
                    ),),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height15*2,),
              //your Email
              // AppTextField(textController: _emailController,
              //     hintText: "Email", iconData: Icons.email, inputType: TextInputType.emailAddress),
              AppTextField(textController: _userNameController,
                hintText: "user Name", iconData: Icons.person, inputType: TextInputType.text,),
              SizedBox(height: Dimensions.height20,),
              //your password
              AppTextField(textController: _passController,
                hintText: "Password", iconData: Icons.password, inputType: TextInputType.visiblePassword,),
              SizedBox(height: Dimensions.height20+Dimensions.height10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Dimensions.width20),
                    child: RichText(text: TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20
                        )
                    )),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.screenHeight*0.07,),
              //Sign In
              GestureDetector(
                onTap: () {
                  _login(authController);
                },
                child: Container(
                  height: Dimensions.screenHeight/14,
                  width: Dimensions.screenWidth/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.mainColor
                  ),child: Center(child: BigText(text: "Sign In",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,)),
                ),
              ),
              SizedBox(height: Dimensions.height50,),


              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20
                      ),children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpScreen()),
                        text: " Create", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Dimensions.font26, color: Colors.black
                    )
                    )
                  ])),
            ],
          ),
        );
      },)
    );
  }
}
