
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPostController extends GetxController {

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

}