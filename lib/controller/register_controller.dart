
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegisterController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isShowPassword = false.obs;
  RxBool isLoading = false.obs;

  void resetInput() {
    email.text = '';
    username.text = '';
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

  Future signup() async {
    try {
      startIsLoading();
      var client = http.Client();
      var res = await client.post(
        Uri.parse('https://socialphoto.vercel.app/api/register'),
        headers: { 'Content-Type': 'application/json'},
        body: jsonEncode(<String, String> {'username': username.text, 'password': password.text, 'email': email.text}),
      );
      stopIsLoading();

      var json = jsonDecode(res.body.toString());
      return json;
      
    } catch (e) {
      print(e);
      return null;
    }
  }


}
