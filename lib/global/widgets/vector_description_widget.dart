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


class VectorDescriptionWidget extends StatelessWidget {
  final String imagePath, description;

  const VectorDescriptionWidget(
      {Key? key, required this.imagePath, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.01),
      showForgotPasswordVector(),
      SizedBox(height: Get.height * 0),
      showForgotPasswordPara(),
      SizedBox(height: Get.height * 0.04)
    ]);
  }

  showForgotPasswordVector({component}) {
    return Container(
        height: Get.height * 0.4,
        width: Get.width * 0.7,
        margin: const EdgeInsets.only(),
        child: Image.asset(imagePath));
  }

  showForgotPasswordPara({component}) {
    return  Text(description,
        style: AppStyles.txt14sizeW700ColorPrimary
            .copyWith(fontWeight: FontWeight.w500,color: AppColors.kcWhite),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
  }
}
