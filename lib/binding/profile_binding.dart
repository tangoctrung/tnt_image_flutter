
import 'package:get/get.dart';
import 'package:socialtnt/controller/auth_controller.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/controller/login_controller.dart';
import 'package:socialtnt/controller/user_controller.dart';

class ProfileBinding extends Bindings {

  @override
  void dependencies() {
    // Get.lazyPut(() => LoginController());
    Get.put(GlobalController());
    Get.put(UserController());
    Get.put(AuthController());
  }
}