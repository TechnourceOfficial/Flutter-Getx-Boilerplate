import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
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
        toWebScreen(slug: Config.cmsAboutUsUrl);
        break;
      case 2:
        toWebScreen(slug: Config.cmsTermsCondition);
        break;
      case 3:
        toWebScreen(slug: Config.cmsPrivacyPolicy);
        break;
      default:
        Utils.logPrint("default");
        break;
    }
  }

  toWebScreen({required String slug}) {
    Get.toNamed(Routes.termsPrivacyScreen, arguments: [
      {Config.argSlug: slug}
    ]);
  }
}
