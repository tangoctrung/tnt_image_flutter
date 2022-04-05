
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePostController extends GetxController {

  GlobalController globalController = Get.put(GlobalController());
  TextEditingController txtBody = TextEditingController();
  TextEditingController txtHashtag = TextEditingController();
  RxString urlImage = "".obs;
  RxList<String> listThemen = <String>[].obs;

  void clearData() {
    txtHashtag.text = "";
    txtBody.text = "";
    urlImage.value = "";
    listThemen.value = [];
  }


  Future createPost() async {
    HandleFormatBody();
    try {
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.post(
        Uri.parse('https://socialphoto.vercel.app/api/createpost'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
        body: jsonEncode(<String, dynamic> {
          "body": txtBody.text,
          "images": urlImage.value,
          "themen": listThemen,
        })
      );

      Map<String, dynamic> json = jsonDecode(res.body.toString());
      print(json);
      if (json["success"] == true) {

        Get.snackbar(
          "Chia sẻ", 
          "Đã chia sẻ bài viết",
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          colorText: const Color.fromARGB(255, 64, 199, 46),
          icon: const Icon(FontAwesomeIcons.checkDouble, color: Color.fromARGB(255, 121, 190, 42)),
        );  
        clearData(); 
      } else {
        Get.snackbar(
          "Lỗi", 
          "Không thể chia sẻ bài viết",
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          colorText: const Color.fromARGB(255, 207, 54, 16),
          icon: const Icon(FontAwesomeIcons.triangleExclamation, color: Color.fromARGB(255, 224, 54, 11)),
        );
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  void HandleFormatBody() {
    String s = txtHashtag.text;
    List<String> hashTags = [];
    hashTags = s.split(' ');
    listThemen.value = hashTags;
  }


}