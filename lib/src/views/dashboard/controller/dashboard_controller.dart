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
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:flutter_setup/src/views/dashboard/model/bottom_navigation_item_model.dart';
import 'package:flutter_setup/src/views/home_page/home_page_view.dart';
import 'package:flutter_setup/src/views/setting_page/setting_page_view.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/src/views/dashboard/component/bottom_navigation/bottom_navigation_child_view.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  DateTime backPressedTime = DateTime.now();
  RxInt currentTabIndex = 0.obs;

  RxList<Widget> widgetOptions = <Widget>[
    HomePageView(),
    const BottomNavigationChild(index: 2),
    const BottomNavigationChild(index: 3),
    SettingPageView(),
  ].obs;

  RxList<BottomNavigationItemModel> bottomNavigationList =
      <BottomNavigationItemModel>[
    BottomNavigationItemModel(
        title: '${R.strings.ksBottomMenu} 1',
        activeImagePath: AppAssets.icActiveBottomHome,
        deActiveImagePath: AppAssets.icDeActiveBottomHome),
    BottomNavigationItemModel(
        title: '${R.strings.ksBottomMenu} 2',
        activeImagePath: AppAssets.icActiveBottomOrder,
        deActiveImagePath: AppAssets.icDeActiveBottomOrder),
    BottomNavigationItemModel(
        title: '${R.strings.ksBottomMenu} 3',
        activeImagePath: AppAssets.icActiveBottomNotification,
        deActiveImagePath: AppAssets.icDeActiveBottomNotification),
    BottomNavigationItemModel(
        title: '${R.strings.ksBottomMenu} 4',
        activeImagePath: AppAssets.icActiveBottomSetting,
        deActiveImagePath: AppAssets.icDeActiveBottomSetting)
  ].obs;

  Future<bool> onBackCalled(BuildContext context) async {
    var difference = DateTime.now().difference(backPressedTime);
    backPressedTime = DateTime.now();
    if (difference >= const Duration(seconds: 2)) {
      toast(context: context, R.strings.ksExitApp);
      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }

  changeTabIndex(int index) {
    currentTabIndex.value = index;
    if (currentTabIndex.value == 0) {
      Logger.logPrint('Bottom Menu-1');
    } else if (currentTabIndex.value == 1) {
      Logger.logPrint('Bottom Menu-2');
    } else if (currentTabIndex.value == 2) {
      Logger.logPrint('Bottom Menu-3');
    } else if (currentTabIndex.value == 3) {
      Logger.logPrint('Bottom Menu-4');
    }
  }
}
