import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/screen/chat_message.dart';
import 'package:socialtnt/screen/create_post.dart';
import 'package:socialtnt/screen/detail_post.dart';
import 'package:socialtnt/screen/forget_password.dart';
import 'package:socialtnt/screen/home.dart';
import 'package:socialtnt/screen/list_chat.dart';
import 'package:socialtnt/screen/list_post.dart';
import 'package:socialtnt/screen/login.dart';
import 'package:socialtnt/screen/post_saved.dart';
import 'package:socialtnt/screen/profile.dart';
import 'package:socialtnt/screen/register.dart';
import 'package:socialtnt/screen/search.dart';
import 'package:socialtnt/screen/wellcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WellCome(),
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => WellCome()),
      //   GetPage(name: '/login', page: () => LoginScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/register', page: () => RegisterScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/forgetPassword', page: () => ForgetPassword(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/mainscreen', page: () => HomeScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/listPost', page: () => ListPostScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/detailPost', page: () => DetailPostScreen(),transition: Transition.downToUp),
      //   GetPage(name: '/search', page: () => SearchScreen(),transition: Transition.fade),
      //   GetPage(name: '/createPost', page: () => CreatePostScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/listChat', page: () => ListChatScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/profile', page: () => ProfileScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/chatMessage', page: () => ChatMessageScreen(),transition: Transition.rightToLeftWithFade),
      //   GetPage(name: '/postSaved', page: () => PostSavedScreen(),transition: Transition.rightToLeftWithFade),
      // ],
      
    );
  }
}
