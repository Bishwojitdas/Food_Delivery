import 'package:flutter/material.dart';
import 'package:food_delivery/screens/account/profile_page.dart';
import 'package:food_delivery/screens/cart/cart_history.dart';
import 'package:food_delivery/screens/cart/cart_pages.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/sign_in/sign_in_page.dart';
import 'package:food_delivery/screens/sign_up/sign_up_page.dart';
import 'package:food_delivery/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int selectedIndex=0;
    List pages=[
        const MainFoodScreen(),
        const CartHistory(),
        const SignUpScreen(),
        const ProfilePage(),
  ];

    void onTapNav(int index){
      setState(() {
        selectedIndex=index;
      });
    }

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pinkAccent,
          selectedItemColor: Colors.indigoAccent,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNav,
          items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home), backgroundColor: Colors.white,
            activeIcon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), backgroundColor: Colors.white,
            activeIcon: Icon(Icons.shopping_cart_outlined), label: "cart"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), backgroundColor: Colors.white,
            activeIcon: Icon(Icons.settings_applications_sharp), label: "Setting"),
        BottomNavigationBarItem(icon: Icon(Icons.person), backgroundColor: Colors.white,
            activeIcon: Icon(Icons.person_2_outlined), label: "Profile"),
      ]),
    );
  }
}
