
import 'package:get/get.dart';
import 'package:socialtnt/controller/home_page_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    // Get.lazyPut(() => LoginController());
    Get.put(HomePageController());
  }
}