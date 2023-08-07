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
