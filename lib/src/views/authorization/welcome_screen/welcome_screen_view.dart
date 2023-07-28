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
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/widgets/app_background.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/authorization/welcome_screen/controller/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: Stack(children: [const AppBackground(), bottomComponent()]));
  }

  bottomComponent() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ksWidgetHorizontalSpace15,
            vertical: ksWidgetVerticalSpace15),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AppButton(
              onTap: () => Get.offAllNamed(Routes.loginScreen),
              btnText: R.strings.ksLoginButtonText),
          const SizedBox(height: ksWidgetVerticalSpace15),
          AppButton(
              onTap: () => Get.offAllNamed(Routes.signupScreen),
              btnBgColor: AppColors.kcPrimaryColor,
              buttonTextStyle: AppStyles.txt14sizeW600ckcWhite,
              btnText: R.strings.ksSignup,
              borderColor: AppColors.kcWhite),
          const SizedBox(height: ksWidgetVerticalSpace15)
        ]));
  }
}
