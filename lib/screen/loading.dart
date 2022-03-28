
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/auth_controller.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  AuthController authController = Get.find();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (authController.isAuth() == true) {
        Get.offAndToNamed('/mainscreen');
      } else if (authController.isAuth() == false) {
        Get.offAndToNamed('/login');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children:  [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SocialPhoto',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 42,
                        fontFamily: 'Lobster',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/bgLoading.png'),
                      width: MediaQuery.of(context).size.width * 0.7,
                    )
                  ]
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container( 
                      width: 30, height: 30, 
                      child: CircularProgressIndicator( 
                        color: Colors.black),
                      )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Copyrighted, design by trungtn@2021',
                  
                    ),
                  ] 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}