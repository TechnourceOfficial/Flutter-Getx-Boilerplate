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
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/import_resources.dart';
import '../../../../global/widgets/circle_image_view.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: ksWidgetVerticalSpace15, bottom: ksWidgetVerticalSpace15),
        child: Row(children: [
          InkWell(
              onTap: () {},
              child: const CircleImageView(
                  imgUrl:
                      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1683006951~exp=1683007551~hmac=2fd06f517ef15e591196789f6c93eecdc5a3779af174d07919ce247af9b9fbe3',
                  backgroundColor: AppColors.kcTransparent)),
          const SizedBox(width: 5),
          const Expanded(
              child: Text('John Deo',
                  style: AppStyles.txt14sizeW600ckcWhite, maxLines: 3)),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.editProfileScreen);
              },
              child: Image.asset(AppAssets.icEdit, height: Get.height * 0.03))
        ]));
  }
}
