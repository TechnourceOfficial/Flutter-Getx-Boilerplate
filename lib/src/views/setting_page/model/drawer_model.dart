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

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class DrawerModel {
  final String icon;
  final String title;
  String? path;
  final int selectedTile;

  DrawerModel(
      {required this.icon,
      required this.title,
      this.path,
      required this.selectedTile});
}

List<DrawerModel> getTopDrawerList() {
  return [
    DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 1',
        selectedTile: 0),
    DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 2',
        selectedTile: 1),
    DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 3',
        selectedTile: 2),
    DrawerModel(
        icon: AppAssets.icBullet,
        title: '${R.strings.ksBottomMenu} 4',
        selectedTile: 3),
    DrawerModel(
        icon: AppAssets.icLanguage,
        title: R.strings.ksChangeLanguage,
        selectedTile: 4),
    DrawerModel(
        icon: AppAssets.icGithub, title: R.strings.ksGitHub, selectedTile: 5),
    DrawerModel(
        icon: AppAssets.icMore, title: R.strings.ksMore, selectedTile: 6)
  ];
}

List<DrawerModel> getBottomDrawerList() {
  return [
    DrawerModel(
        icon: AppAssets.icLogout,
        title: R.strings.ksDeleteAccount,
        selectedTile: 0),
    DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksDeactivateAccount,
        selectedTile: 1),
    DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksLogOut,
        selectedTile: 2)
  ];
}
