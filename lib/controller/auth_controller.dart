
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  

  String? username = '';
  String? avatar = '';
  String? email = '';
  String? id = '';
  String? token = '';

  @override
  void onInit() async {
    await authData();
    super.onInit();
  }
  authData() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    token = prefs.getString('token');
    print(token);
  }

  bool isAuth() {
    if (token == null) return false;
    return true;
  }

  doLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('avatar');
    await prefs.remove('id');
    await prefs.remove('email');
    await prefs.remove('token');
    Get.offAndToNamed('/login');
  }
  
}