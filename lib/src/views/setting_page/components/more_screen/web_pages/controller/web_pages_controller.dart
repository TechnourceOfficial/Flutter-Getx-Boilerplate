import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPagesController extends GetxController {
  String webSlug = "";
  RxBool isLoading = true.obs;
  WebViewController? webViewController;
  dynamic arguments = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    if (arguments != null) {
      webSlug = arguments[0][Config.argSlug];
    }
  }

  @override
  void onClose() {
    super.onClose();
    webSlug = "";
  }

  getTitleOrUrl(bool isUrl) {
    var titleMap = {
      Config.cmsPrivacyPolicy:
          isUrl ? Config.privacyPolicyUrl : R.strings.ksPrivacyPolicy,
      Config.cmsAboutUsUrl: isUrl ? Config.aboutUsUrl : R.strings.ksAboutUs,
      Config.cmsTermsCondition:
          isUrl ? Config.termsAndCondition : R.strings.ksTermsAndConditions,
    };
    return titleMap[webSlug] ?? "";
  }
}
