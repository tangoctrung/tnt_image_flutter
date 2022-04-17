
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialtnt/config/url.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/controller/home_page_controller.dart';
import 'package:socialtnt/controller/user_controller.dart';
import 'package:socialtnt/model/user.dart';
import 'package:socialtnt/screen/main_screen.dart';


class LoginController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isShowPassword = false.obs;
  RxBool isLoading = false.obs;
  GlobalController globalController = Get.put(GlobalController());
  HomePageController hpController = Get.put(HomePageController());
  String url_api = URL.URL_API;

  

  void resetInput() {
    email.text = '';
    password.text = '';
  }

  void changeDisplayPassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  void startIsLoading() {
    isLoading.value = true;
  }

  void stopIsLoading() {
    isLoading.value = false;
  }

  Future login() async {
    try {
      startIsLoading();
      var client = http.Client();
      var res = await client.post(
        Uri.parse(url_api + 'login'),
        headers: { 'Content-Type': 'application/json'},
        body: jsonEncode(<String, String> {'password': password.text, 'email': email.text}),
      );
      stopIsLoading();
      User userInfo = User();
      var json = jsonDecode(res.body.toString());
      if (json["success"] == true) {
        var data = json["data"];
        var user = data["newUser"];

        final prefs = await SharedPreferences.getInstance();
        
        await prefs.setString('token', data["token"]);
        userInfo.username = user["username"];
        userInfo.address = user["address"];
        userInfo.avatar = user["avatar"];
        userInfo.date = user["date"];
        userInfo.email = user["email"];
        userInfo.id = user["_id"];
        userInfo.job = user["job"];
        userInfo.postSaved = user["postSaved"];
        userInfo.token = data["token"];

        globalController.user.value = userInfo;
        globalController.postSaved.value = user["postSaved"];
        await Get.put(UserController()).getAllPost();
        await hpController.getPostsInvolve(); 
        await hpController.getPostsDiscover(); 

        Get.offAndToNamed('mainscreen');                   
      } else {
        Get.snackbar(
          "Lỗi đăng nhập", 
          json["message"],
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          colorText: Color.fromARGB(255, 248, 46, 46),
          icon: Icon(Icons.error, color: Colors.red),
        );
      }
      // return json;
      
    } catch (e) {
      print(e);
      return null;
    }
  }


}
