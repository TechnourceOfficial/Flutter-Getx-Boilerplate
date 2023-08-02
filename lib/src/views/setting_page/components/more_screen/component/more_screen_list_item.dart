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
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/widgets/common_widgets.dart';
import 'package:flutter_setup/src/views/setting_page/components/more_screen/controller/more_screen_controller.dart';
import 'package:flutter_setup/src/views/setting_page/components/more_screen/model/more_menu_model.dart';
import 'package:get/get.dart';

var _ksWidgetVerticalSpace = Get.height * 0.02;

class MoreScreenListItem extends StatelessWidget {
  final MoreMenuModel menuItem;
  final GestureTapCallback? onTap;

  const MoreScreenListItem({Key? key, required this.menuItem, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(children: [
          SizedBox(height: _ksWidgetVerticalSpace),
          Container(
              margin: EdgeInsets.only(left: Get.width * 0.02),
              child: Row(children: [
                Expanded(
                    child: Text(menuItem.title,
                        style: AppStyles.txt12sizeW600ColorPrimary))
              ])),
          SizedBox(height: _ksWidgetVerticalSpace),
          const BuildGreyDivider(opacity: 0.2)
        ]));
  }
}
