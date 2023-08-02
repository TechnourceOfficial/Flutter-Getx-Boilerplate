import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/global/widgets/common_appbar_white.dart';
import 'package:flutter_setup/global/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/web_pages_controller.dart';

class WebPagesView extends GetView<WebPagesController> {
  const WebPagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcWhite,
        appBar: buildCommonWhiteAppbar(),
        body: Obx(
          () => Stack(children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ksBodyHorizontalSpace15,
                    vertical: ksBodyVerticalSpace15),
                child: buildWebView()),
            Visibility(
                visible: controller.isLoading.value,
                child: const CustomProgressIndicatorWidget())
          ]),
        ));
  }

  buildWebView() {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
        child: WebView(
            initialUrl: controller.getTitleOrUrl(true),
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              controller.isLoading.value = false;
            },
            onWebViewCreated: (WebViewController webViewController) {
              controller.webViewController = webViewController;
            }));
  }

  buildCommonWhiteAppbar() {
    return CommonWhiteAppbar(
        title: controller.getTitleOrUrl(false), appBar: AppBar());
  }
}
