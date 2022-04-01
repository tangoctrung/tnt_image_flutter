import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/auth_controller.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/screen/create_post.dart';
import 'package:socialtnt/screen/home.dart';
import 'package:socialtnt/screen/info_user_other.dart';
import 'package:socialtnt/screen/list_chat.dart';
import 'package:socialtnt/screen/profile.dart';
import 'package:socialtnt/screen/search.dart';
import 'package:socialtnt/widget/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  GlobalController globalController = Get.put(GlobalController());
  AuthController authController = Get.put(AuthController());
  // @override
  // void initState() {
    
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (authController.isAuth() == false) {
  //       Get.offAndToNamed('/login');
  //     }
  //   });
  //   super.initState(); 
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomNavigator(),
        body: PageView(
          controller: globalController.pageController,
          onPageChanged: (value) {
            globalController.onChangeTab(value);
          },
          // physics:const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            SearchScreen(),
            CreatePostScreen(),
            ListChatScreen(),
            ProfileScreen(),
          ],
        ),
        
      ),
    );
  }
}