import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 6, 117, 207),
      ),
      home: Scaffold(
        body: Container(
          width: 200,
          height: 200,
          color: Color.fromARGB(255, 123, 123, 234),
        )
      ),
    );
  }
}