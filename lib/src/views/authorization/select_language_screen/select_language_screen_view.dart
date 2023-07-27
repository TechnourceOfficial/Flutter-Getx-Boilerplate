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
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/global/widgets/app_background.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import '../../../../global/preference/user_preference.dart';
import '../../../../global/utils/utils.dart';
import '../../../../global/widgets/common_dropdown.dart';
import '../../../routes/app_pages.dart';
import 'controller/select_language_controller.dart';
import 'model/get_language_list_model.dart';

class SelectLanguageScreenView extends GetView<SelectLanguageController> {
  const SelectLanguageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: Obx(() {
          return Stack(children: [const AppBackground(), languageBodyView()]);
        }));
  }

  languageBodyView() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ksWidgetVerticalSpace15,
            horizontal: ksWidgetHorizontalSpace15),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          buildLanguageDropDown(),
          const SizedBox(height: ksBodyVerticalSpace30),
          AppButton(
            btnText: R.strings.btnNext,
            onTap: () {
              if (controller.selectedLanguage.value.langId == "-1") {
                Utils.errorSnackBar(message: R.strings.erSelectLanguageMsg);
              }  else {
                Get.toNamed(Routes.welcomeScreen);
              }
            },
          ),
          const SizedBox(height: ksBodyVerticalSpace30)
        ]));
  }

  buildLanguageDropDown() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(R.strings.hnSelectLanguage, style: R.styles.txt14sizeW600ckcWhite),
      const SizedBox(height: ksWidgetVerticalSpace15),
      Obx(() => CommonDropDownWidget(
          onChanged: (data) {
            controller.selectedLanguage.value = data!;
            controller.selectedLanguageName.value = data.langName.toString();
            Config.setLocale.value =
                controller.selectedLanguage.value.langCode.toString();
            AppSession.setSelectedLanguageId(Config.setLocale.value);
            Get.updateLocale(Locale(Config.setLocale.value));
            controller.update();
          },
          items: controller.languageList.map((LanguageData genre) {
            return DropdownMenuItem<LanguageData>(
                value: genre,
                child: Text(genre.langName!,
                    style: R.styles.txt14sizeW500CaptionLightGray));
          }).toList(),
          hintText: R.strings.hnSelectLanguage,
          value: controller.selectedLanguage.value.langId != "-1"
              ? controller.selectedLanguage.value
              : null))
    ]);
  }
}
