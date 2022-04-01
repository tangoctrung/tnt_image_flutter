
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPostController extends GetxController {

  TextEditingController contentComment = TextEditingController();
  GlobalController globalController = Get.put(GlobalController());
  RxMap<dynamic, dynamic> postDetail = {}.obs;
  RxList<dynamic> listComment = [].obs;



  Future getPostDetail(postId) async {

    try {
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/getpost/$postId'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );


      Map<String, dynamic> json = jsonDecode(res.body.toString());
      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        Map<String, dynamic> newPost = data["post"];

        // posts.value = newPosts; 
   
        postDetail.clear();
        postDetail.value = newPost;
        
      }
    } catch (e) {
      print(e);
      return null;
    }


  }

   Future getComments(postId) async {
    try {
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.get(
        Uri.parse('https://socialphoto.vercel.app/api/getallComment/$postId'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
      );
      Map<String, dynamic> json = jsonDecode(res.body.toString());
      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        List<dynamic> comments = data["comments"];
        // posts.value = newPosts;   
        listComment.clear();
        listComment.value = comments;       
      }
    } catch (e) {
      print(e);
      return null;
    }  
  }

  Future createComment(postId) async {
    try {
      print('123');
      print(postId);
      var token = globalController.user.value.token;
      var client = http.Client();
      var res = await client.post(
        Uri.parse('https://socialphoto.vercel.app/api/createComment'),
        headers: { 'Content-Type': 'application/json', 'Authorization': 'Bear $token'},
        body: jsonEncode(<String, String>{'content': contentComment.text, 'postId': postId}),
      );

      print(res);

      Map<String, dynamic> json = jsonDecode(res.body.toString());
      print(json);
      if (json["success"] == true) {
        Map<String, dynamic> data = json["data"];
        Map<dynamic, dynamic> comment = data["comment"];
      
        print(comment);
        // posts.value = newPosts; 
   
        listComment.add(comment);
        contentComment.text = '';
        Get.snackbar(
          "Bình luận", 
          "Bình luận bài viết thành công",
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          colorText: const Color.fromARGB(255, 64, 199, 46),
          icon: const Icon(Icons.add_task, color: Color.fromARGB(255, 121, 190, 42)),
        );      
      } else {
        Get.snackbar(
          "Bình luận", 
          "Không thể bình luận bài viết",
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          colorText: const Color.fromARGB(255, 207, 54, 16),
          icon: const Icon(Icons.error, color: Color.fromARGB(255, 224, 54, 11)),
        );
      }
    } catch (e) {
      print(e);
      return null;
    }

    
  }

}