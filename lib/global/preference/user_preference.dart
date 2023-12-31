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

import 'package:flutter_setup/global/preference/session_keys.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///TO manage Logged in user's session
class AppSession {
  static GetStorage? sessionData;
  static GetStorage? introScreenData;

  static void init() {
    introScreenData = GetStorage();

    sessionData = GetStorage();
  }

  static void clearStorage() {
    sessionData!.erase();
    init();
  }

  static void setSelectedLanguageId(String? value) {
    sessionData!.write(UserSessionDetail.kSelectedLanguageId, value);
  }

  static String getSelectedLanguageId() {
    return sessionData?.read(UserSessionDetail.kSelectedLanguageId) ??
        Config.langCodeEn;
  }

  static void setAccessToken(String? value) {
    sessionData!.write(UserSessionDetail.kAccessToken, value);
  }

  static String getAccessToken() {
    return sessionData?.read(UserSessionDetail.kAccessToken) ?? '';
  }

  static bool isAuthenticationDone() {
    bool isAuthDone = AppSession.getAccessToken().isNotEmpty &&
        AppSession.getAccessToken() != '';
    if (isAuthDone) {
      return true;
    }
    return isAuthDone;
  }

  static bool isIntroScreenDone() {
    return introScreenData!.read(UserSessionDetail.kIsIntroScreenDone) ?? false;
  }

  static setIsIntroScreenDone(bool isDone) {
    introScreenData!.write(UserSessionDetail.kIsIntroScreenDone, isDone);
  }

  static Future<void> logoutUser() async {
    AppSession.clearStorage();
    AppSession.init();
    AppSession.setAccessToken("");
    Get.offAllNamed(Routes.loginScreen);
  }
}
