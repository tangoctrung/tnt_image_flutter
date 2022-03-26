import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/screen/create_post.dart';
import 'package:socialtnt/screen/home.dart';
import 'package:socialtnt/screen/list_chat.dart';
import 'package:socialtnt/screen/profile.dart';
import 'package:socialtnt/screen/search.dart';
import 'package:socialtnt/widget/bottom_bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomNavigator(),
        body: PageView(
          controller: Get.put(GlobalController()).pageController,
          onPageChanged: (value) {
            Get.put(GlobalController()).onChangeTab(value);
          },
          physics:const NeverScrollableScrollPhysics(),
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