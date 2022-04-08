
import 'dart:convert';

import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:http/http.dart' as http;

class ListChatController extends GetxController {
  RxList<dynamic> listChat = <dynamic>[].obs;
  RxList<dynamic> listUser = <dynamic>[].obs;
  GlobalController globalController = Get.put(GlobalController());


  Future getConversations() async {

    try {
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/getConversation'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );


      Map<String, dynamic> json = jsonDecode(res.body.toString());
      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        List<dynamic> conversations = data["conversations"];

        // posts.value = newPosts; 

        listChat.clear();
        listChat.value = conversations;
        
      }
      return true;
    } catch (e) {
      print(e);
      return null;
    }


  }
}