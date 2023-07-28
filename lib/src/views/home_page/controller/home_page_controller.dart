import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  RxBool isSearch = false.obs;
}
