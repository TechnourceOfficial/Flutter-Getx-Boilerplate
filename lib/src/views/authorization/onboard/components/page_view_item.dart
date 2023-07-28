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

import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_setup/src/views/authorization/onboard/model/on_board_item_model.dart';

const ksWidgetVerticalSpace40 = 40.0;

class PageViewItem extends StatelessWidget {
  final OnBoardItemModel onBoardItemModel;

  const PageViewItem({Key? key, required this.onBoardItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.03),
      Image.asset(onBoardItemModel.imgPath.toString(),
          height: Get.height * 0.4),
      const SizedBox(height: ksWidgetVerticalSpace40),
      Text(onBoardItemModel.title.toString(), style: AppStyles.txtIntroTitle),
      SizedBox(height: Get.height * 0.01),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: Text(onBoardItemModel.description.toString(),
              style: AppStyles.txt16sizeW600CaptionLightGray,
              textAlign: TextAlign.center))
    ]);
  }
}
