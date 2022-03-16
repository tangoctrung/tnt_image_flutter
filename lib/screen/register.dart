import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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