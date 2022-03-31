import 'dart:convert';

import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/controller/user_controller.dart';
import 'package:socialtnt/model/user.dart';
import 'package:http/http.dart' as http;

class InfoUserOtherController extends GetxController {
  Rx<User> user = User().obs;
  RxList<Post> posts = <Post>[].obs;
  GlobalController globalController = Get.put(GlobalController());
  String? userId  = "";

  void getUserId(String id) {
    userId = id;
  }


  Future getAllPost() async {
    try {
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/getpostuser/$userId'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );


      Map<String, dynamic> json = jsonDecode(res.body.toString());

      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        List<dynamic> newPosts = data["posts"];

        // posts.value = newPosts; 
        List<Post> res = [];

        for (int i = 0; i < newPosts.length; i++) {
          Post item = Post();
          item.id = newPosts[i]["_id"];
          item.authorId = newPosts[i]["authorId"]["_id"];
          item.authorAvatar = newPosts[i]["authorId"]["avatar"];
          item.authorName = newPosts[i]["authorId"]["username"];
          item.body = newPosts[i]["body"];
          item.createdAt = newPosts[i]["createdAt"];
          item.updatedAt = newPosts[i]["updatedAt"];
          item.images = newPosts[i]["images"];
          // item.likes = newPosts[i]["likes"];
          item.totalReport = newPosts[i]["totalReport"];
          // item.themen = newPosts[i]["themen"];
          res.add(item);
        }
        posts.clear();
        posts.value = res;
                  
      } 
      // return json;    
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getInfoUser() async {
    try {
      var token = globalController.user.value.token;
      print("le van an");
      if (userId != null && userId != "") {
        var client = http.Client();
        var res = await client.get(
          Uri.parse('https://socialphoto.vercel.app/api/getUser/$userId'),
          headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
        );
        User userInfo = User();
        var json = jsonDecode(res.body.toString());
        print(json);
        if (json["success"] == true) {
          var data = json["data"];
          var newUser = data["user"];

          
          userInfo.username = newUser["username"];
          userInfo.address = newUser["address"];
          userInfo.avatar = newUser["avatar"];
          userInfo.date = newUser["date"];
          userInfo.email = newUser["email"];
          userInfo.id = newUser["_id"];
          userInfo.job = newUser["job"];

          user.value = userInfo;
      } 
        
      } 
    } catch (e) {

    }
  }




}