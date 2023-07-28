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
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/src/views/dashboard/model/bottom_navigation_item_model.dart';

class BottomNavigationItemIcon extends StatelessWidget {
  final BottomNavigationItemModel bottomNavigationItemModel;
  final bool isActive;

  const BottomNavigationItemIcon(
      {Key? key,
      required this.bottomNavigationItemModel,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.02),
      SvgPicture.asset(isActive
          ? bottomNavigationItemModel.activeImagePath
          : bottomNavigationItemModel.deActiveImagePath),
      SizedBox(height: Get.height * 0.009),
      Text(bottomNavigationItemModel.title,
          style: AppStyles.selectedLabelStyle),
      isActive
          ? Column(children: [
              SizedBox(height: Get.height * 0.009),
              Container(
                  width: Get.width * 0.06,
                  height: Get.height * 0.006,
                  color: AppColors.kcYellow)
            ])
          : Container()
    ]);
  }
}