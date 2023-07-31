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

import 'dart:ui';

import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/src/views/setting_page/model/drawer_model.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import '../../../../global/dialog/dialog_helper.dart';

class SettingPageController extends GetxController {
  static SettingPageController get to => Get.find();
  var drawerList = <DrawerModel>[].obs;
  var drawerBottomList = <DrawerModel>[].obs;
  RxInt selectedBottomDrawerMenu = 0.obs, selectedDrawerMenu = 0.obs;

  @override
  void onReady() {
    super.onReady();
    drawerList.add(DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 1',
        selectedTile: 0));
    drawerList.add(DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 2',
        selectedTile: 1));
    drawerList.add(DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 3',
        selectedTile: 2));
    drawerList.add(DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 4',
        selectedTile: 3));
    drawerList.add(DrawerModel(
        icon: AppAssets.icLanguage,
        title: R.strings.ksChangeLanguage,
        selectedTile: 4));
    drawerList.add(DrawerModel(
        icon: AppAssets.icGithub, title: R.strings.ksGitHub, selectedTile: 5));
    drawerList.add(DrawerModel(
        icon: AppAssets.icMore, title: R.strings.ksMore, selectedTile: 6));
    drawerBottomList.add(DrawerModel(
        icon: AppAssets.icLogout,
        title: R.strings.ksDeleteAccount,
        selectedTile: 0));
    drawerBottomList.add(DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksDeactivateAccount,
        selectedTile: 1));
    drawerBottomList.add(DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksLogOut,
        selectedTile: 2));
  }

  onDrawerItemTap({required DrawerModel drawerModel}) {
    selectedDrawerMenu.value = drawerModel.selectedTile;
    switch (drawerModel.selectedTile) {
      case 0:
        Utils.logPrint(drawerModel.title);
        break;
      case 1:
        Utils.logPrint(drawerModel.title);
        break;
      case 2:
        Utils.logPrint(drawerModel.title);
        break;
      case 3:
        Utils.logPrint(drawerModel.title);
        break;
      case 4:
        Utils.logPrint(drawerModel.title);
        break;
      case 5:
        Utils.logPrint(drawerModel.title);
        openGithub(url: Config.githubRepoLink);
        break;
      case 6:
        Utils.logPrint(drawerModel.title);
        break;
    }
  }

  onBottomItemTap({required DrawerModel drawerModel}) {
    selectedBottomDrawerMenu.value = drawerModel.selectedTile;
    switch (drawerModel.selectedTile) {
      case 0:
        Utils.logPrint(drawerModel.title);
        showCommonDialogue(
            title: R.strings.ksDeleteAccount,
            description: R.strings.ksDeleteAccountDescription);
        break;
      case 1:
        Utils.logPrint(drawerModel.title);
        showCommonDialogue(
            title: R.strings.ksDeactivateAccount,
            description: R.strings.ksDeactivateAccountDescription);
        break;
      case 2:
        Utils.logPrint(drawerModel.title);
        showCommonDialogue(
            title: R.strings.ksLogOut,
            description: R.strings.ksLogoutAccountDescription);
        break;
    }
  }

  Future<void> openGithub({required String url}) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  showCommonDialogue(
      {required String title,
      required String description,
      VoidCallback? onPositiveButtonTap,
      onNegativeButtonTap}) {
    DialogueHelper.showCommonDialogue(
      onPositiveClick: () => onPositiveButtonTap ?? Get.back(),
      onNegativeClick: () => onNegativeButtonTap ?? Get.back(),
      title: title,
      description: description,
      positiveBtnText: R.strings.ksYes,
      cancelBtnText: R.strings.ksNo,
    );
  }
}
