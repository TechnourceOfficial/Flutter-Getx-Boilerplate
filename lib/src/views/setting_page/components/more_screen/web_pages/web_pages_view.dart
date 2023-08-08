/*
 * Copyright (c) 2023 Technource. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *  Email: support@technource.com
 *  Developed by Technource (https://www.technource.com)
 */

import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_setup/global/utils/network.dart';
import 'package:flutter_setup/global/widgets/common_appbar_white.dart';
import 'package:flutter_setup/global/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/web_pages_controller.dart';

class WebPagesView extends GetView<WebPagesController> {
  const WebPagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcWhite,
        appBar: buildCommonWhiteAppbar(),
        body: webView());
  }

  webView() {
    return Visibility(
      visible: Network.isInternetConnected.value,
      replacement: noInternetView(),
      child: Obx(
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
      ),
    );
  }

  Padding noInternetView() {
    return Padding(
        padding: EdgeInsets.only(top: Get.height * 0.2, left: 20),
        child: Column(children: [
          Lottie.asset(AppAssets.icNoInternet),
          Text(R.strings.ksNoInternet, style: AppStyles.txt18sizeW600BlackColor)
        ]));
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
