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

import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/authorization/onboard/model/on_board_item_model.dart';

class OnBoardController extends GetxController {
  PageController pageController = PageController();
  RxList<OnBoardItemModel> onboardItemList = <OnBoardItemModel>[
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 1',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 1'),
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 2',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 2'),
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 3',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 3'),
  ].obs;

  var selectedIndicator = 0.obs;

  changeIndicator({required index}) {
    selectedIndicator.value = index;
  }

  skipNextTapped() {
    AppSession.setIsIntroScreenDone(true);
    Get.offAllNamed(Routes.welcomeScreen);
  }

  onNextTap() {
    if (selectedIndicator.value == onboardItemList.length - 1) {
      skipNextTapped();
    } else {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }
}
