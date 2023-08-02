import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/src/views/setting_page/components/more_screen/model/more_menu_model.dart';
import 'package:get/get.dart';
import '../../../../../../global/constant/resources/resources.dart';

class MoreScreenController extends GetxController {
  var moreMenuList = <MoreMenuModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    moreMenuList.addAll(getMoreMenu());
  }

  Future<void> selectMoreScreenItem({required MoreMenuModel item}) async {

    switch (item.id) {
      case 1:
        Utils.logPrint("case privacy policy");
        break;
      case 2:
        Utils.logPrint("case 2");
        break;
      case 3:
        Utils.logPrint("case 3");
        break;
      default:
        Utils.logPrint("default");
        break;
    }
  }
}
