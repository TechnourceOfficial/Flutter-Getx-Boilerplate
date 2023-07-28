import 'package:flutter_setup/src/views/home_page/controller/home_page_controller.dart';
import 'package:get/get.dart';


class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }

}