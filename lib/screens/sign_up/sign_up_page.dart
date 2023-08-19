import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/model/sign_up_model.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custom_loader.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var _formKey=GlobalKey<FormState>();

    final _nameController=TextEditingController();
    final _phoneController=TextEditingController();
    final _emailController=TextEditingController();
    final _passController=TextEditingController();

    var signUpImages=[
      "twitter.png",
      "facebook_icon.png",
      "google.png"
    ];

    void registration(AuthController authController){
      String name=_nameController.text.trim();
      String phone=_phoneController.text.trim();
      String email=_emailController.text.trim();
      String password=_passController.text.trim();
      if(email.isEmpty){
        showCustomSnackbar("Type your email address", title: "Email Address");
      }
      else if(phone.isEmpty){
      showCustomSnackbar("Type your phone", title: "Phone");
      }else if(name.isEmpty){
        showCustomSnackbar("Type your name", title: "Name");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackbar("Type in a valid email address", title: "Valid Email Address");
      }else if(phone.isEmpty){
        showCustomSnackbar("Type your phone", title: "Phone");
      }else if(password.isEmpty){
        showCustomSnackbar("Type your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackbar("Password cannot be less than six characters", title: "Pasword");
      }else{
        showCustomSnackbar("All wents well", title: "Perfect");
        SignUpModel signUpBody=SignUpModel(
            firstName: name,
            mobile:phone,
            email: email,
            password: password,
          address: "Rangamati",
          districtId: 32,
          lastName: "Das",
          postCode: 3900,
        );
            authController.registration(signUpBody).then((status) {
              if(status.isSuccess){
                print("Registration Success");
              }else{
                showCustomSnackbar(status.message);
              }
            });
      }
    }



    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading?
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              //appIcon
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
              SizedBox(height: Dimensions.height20,),
              //your email
              AppTextField(textController: _emailController,
                  hintText: "Email", iconData: Icons.email, inputType: TextInputType.emailAddress),
              SizedBox(height: Dimensions.height20,),
              //your password
              AppTextField(textController: _passController,
                isObsecure: true,
                hintText: "Password", iconData: Icons.password, inputType: TextInputType.visiblePassword,),
              SizedBox(height: Dimensions.height20,),
              //your Name
              AppTextField(textController: _nameController,
                hintText: "Name", iconData: Icons.person, inputType: TextInputType.text,),
              SizedBox(height: Dimensions.height20,),
              //your phone
              AppTextField(textController: _phoneController,
                hintText: "Phone", iconData: Icons.phone, inputType: TextInputType.number,),
              SizedBox(height: Dimensions.height20+Dimensions.height20,),
              //SignUp Button
              GestureDetector(
                onTap: () {
                  registration(_authController);
                },
                child: Container(
                  height: Dimensions.screenHeight/14,
                  width: Dimensions.screenWidth/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.mainColor
                  ),child: Center(child: BigText(text: "Sign Up",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,)),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              //tagLine
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20
                  )
              )),
              SizedBox(height: Dimensions.screenHeight*0.03,),
              //Sign up options
              RichText(text: TextSpan(
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16
                  )
              )),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/"+signUpImages[index]),
                  ),
                )),
              )
            ],
          ),
        )
            :Center(child: CustomLoader());
      },)
    );
  }
}
