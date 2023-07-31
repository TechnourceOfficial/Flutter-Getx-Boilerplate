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
import 'package:flutter_setup/src/views/setting_page/model/drawer_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/import_resources.dart';
import '../../../../global/preference/user_preference.dart';

class DrawerListItemWidget extends StatelessWidget {
  final DrawerModel drawerModel;
  final GestureTapCallback? onTap;
  final bool displayLang;
  final bool? isDecorated;

  const DrawerListItemWidget(
      {Key? key,
      this.onTap,
      required this.drawerModel,
      this.isDecorated,
      required this.displayLang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: isDecorated != null && isDecorated == true
          ? BoxDecoration(
              color: const Color.fromRGBO(162, 168, 181, 0.35),
              borderRadius: BorderRadius.circular(8))
          : null,
      child: InkWell(
          onTap: onTap,
          child: Row(children: [
            Expanded(
                child: Row(children: [
              SizedBox(
                  width: Get.width * 0.06,
                  child: SvgPicture.asset(drawerModel.icon)),
              SizedBox(width: Get.width * 0.04),
              Flexible(
                  child: Text(drawerModel.title,
                      style: AppStyles.txt16sizeW600CaptionLightGray,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis))
            ])),
            Visibility(
              visible: displayLang,
              child: Row(children: [
                Text(
                    AppSession.getSelectedLanguageId().toUpperCase().toString(),
                    style: AppStyles.txt16sizeW600CaptionLightGray
                        .copyWith(color: AppColors.kcWhite)),
                const Icon(Icons.keyboard_arrow_right, color: AppColors.kcWhite)
              ]),
            )
          ])),
    );
  }
}
