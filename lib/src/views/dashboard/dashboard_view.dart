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
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/src/views/dashboard/component/bottom_navigation/bottom_navigation_item_icon.dart';
import 'package:flutter_setup/src/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_setup/src/views/dashboard/model/bottom_navigation_item_model.dart';

class DashboardScreen extends GetView<DashboardController> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => controller.onBackCalled(context),
        child: Scaffold(
            bottomNavigationBar: buildBottomNavigationMenu(),
            body: Obx(() =>
                controller.widgetOptions[controller.currentTabIndex.value])));
  }

  buildBottomNavigationMenu() {
    return Obx(() {
      return BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: controller.changeTabIndex,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentTabIndex.value,
          backgroundColor: AppColors.kcPrimaryColor,
          selectedFontSize: 0,
          items: controller.bottomNavigationList
              .map((e) =>
                  buildBottomNavigationBarItem(bottomNavigationItemModel: e))
              .toList());
    });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {BottomNavigationItemModel? bottomNavigationItemModel}) {
    return BottomNavigationBarItem(
        icon: BottomNavigationItemIcon(
            bottomNavigationItemModel: bottomNavigationItemModel!,
            isActive: false),
        activeIcon: BottomNavigationItemIcon(
            bottomNavigationItemModel: bottomNavigationItemModel,
            isActive: true),
        label: '',
        backgroundColor: AppColors.kcPrimaryColor);
  }
}
