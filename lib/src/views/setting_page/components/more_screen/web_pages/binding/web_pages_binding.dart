import 'package:get/get.dart';
import '../controller/web_pages_controller.dart';

class WebPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebPagesController>(() => WebPagesController());
  }
}
