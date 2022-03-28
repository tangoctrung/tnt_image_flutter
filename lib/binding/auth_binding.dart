
import 'package:get/get.dart';
import 'package:socialtnt/controller/auth_controller.dart';
import 'package:socialtnt/controller/login_controller.dart';

class AuthBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(AuthController());
  }
}