

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:http/http.dart' as http;


class Post {
  String? id;
  String? body;
  List<String>? likes;
  String? images;
  int? totalReport;
  String? authorId;
  String? authorName;
  String? authorAvatar;
  List<String>? themen;
  String? createdAt;
  String? updatedAt;
}

class UserController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController job = TextEditingController();
  
  GlobalController globalController = Get.put(GlobalController());

  RxList<Post> posts = <Post>[].obs;

  Future getAllPost() async {
    try {
      var token = globalController.user.value.token;
      var userId = globalController.user.value.id;
      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/getpostuser/$userId'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );

      print(res);

      Map<String, dynamic> json = jsonDecode(res.body.toString());
      // print(json);
      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        List<dynamic> newPosts = data["posts"];
        print(newPosts.length);

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
        print(posts.value[0].authorName);
        
                   
      } 
      // return json;
      
    } catch (e) {
      print(e);
      return null;
    }
  }
}