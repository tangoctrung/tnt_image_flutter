import 'package:flutter/material.dart';
import 'package:socialtnt/screen/detail_post.dart';
import 'package:socialtnt/screen/forget_password.dart';
import 'package:socialtnt/screen/home.dart';
import 'package:socialtnt/screen/list_post.dart';
import 'package:socialtnt/screen/login.dart';
import 'package:socialtnt/screen/register.dart';
import 'package:socialtnt/screen/wellcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WellCome(),
      initialRoute: '',
      routes: {
        '': (context) => WellCome(),
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'forgetPassword': (context) => ForgetPassword(),
        'home': (context) => HomeScreen(),
        'listPost': (context) => ListPostScreen(),
        'detailPost': (context) => DetailPostScreen(),
      },
    );
  }
}
