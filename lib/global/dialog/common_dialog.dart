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
 *  Email: info@technource.in
 *  Developed by Technource (https://www.technource.com)
 */

import 'package:flutter/material.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';

import '../constant/resources/resources.dart';
import '../utils/config.dart';

class CommonDialog extends StatelessWidget {
  final String? positiveBtnText, negativeBtnText, title;
  final String description;
  final VoidCallback? onPositiveTap, onNegativeTap;

  const CommonDialog(
      {Key? key,
      this.title,
      this.positiveBtnText,
      this.negativeBtnText,
      required this.description,
      this.onPositiveTap,
      this.onNegativeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDialogueHeader(),
                        Padding(
                         padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children: [
                            SizedBox(height: Get.height * 0.03),
                            buildDesc(description: description),
                            SizedBox(height: Get.height * 0.05),
                            buildBtn(),
                            const SizedBox(height: 15)
                          ])
                        )

                      ]))
            ]))));
  }

  buildDesc({required String description}) {
    return Center(
        child: Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: R.colors.kcCaptionLightGray)));
  }

  buildBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: AppButton(
              btnText: positiveBtnText ?? R.strings.btnYes,
              btnBgColor: R.colors.kcYellow,
              height: Get.height * 0.06,
              onTap: onPositiveTap)),
      SizedBox(width: Get.width * 0.08),
      Expanded(
          child: AppButton(
              btnBgColor: R.colors.kcWhite,
              btnText: negativeBtnText ?? "",
              height: Get.height * 0.06,
              onTap: onNegativeTap,
              borderColor: R.colors.kcPrimaryColor))
    ]);
  }

  buildDialogueHeader() {
    return ListTile(
      title: Text(title == null ? Config.appName : title!,
          textAlign: TextAlign.center,
          style: R.styles.txt16sizeW600CaptionLightGray
              .merge(TextStyle(color: R.colors.kcBlack))),
      trailing: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Icon(Icons.clear,
                  size: 25, color: R.colors.kcCaptionLightGray))),
    );
  }
}
