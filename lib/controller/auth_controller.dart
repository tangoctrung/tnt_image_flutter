
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/controller/user_controller.dart';
import 'package:socialtnt/model/user.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{

  String? token = '';
  GlobalController globalController = Get.put(GlobalController());

  @override
  void onInit() async {
    await authData();
    super.onInit();
  }
  authData() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  bool isAuth() {
    if (token == null) return false;
    return true;
  }

  Future<void> getInfoUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();        
      String? token = prefs.getString('token');


      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );
      User userInfo = User();
      var json = jsonDecode(res.body.toString());
      if (json["success"] == true) {
        var data = json["data"];
        var user = data["user"];

        
        userInfo.username = user["username"];
        userInfo.address = user["address"];
        userInfo.avatar = user["avatar"];
        userInfo.date = user["date"];
        userInfo.email = user["email"];
        userInfo.id = user["_id"];
        userInfo.job = user["job"];
        userInfo.postSaved = user["postSaved"];
        userInfo.token = token;
        Get.put(GlobalController()).user.value = userInfo;
        await Get.put(UserController()).getAllPost();
        
      } 
    } catch (e) {

    }
  }

  doLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offNamed('/login');
  }
  
}