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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/import_resources.dart';
import '../../../../global/widgets/custom_text_field.dart';
import 'controller/login_screen_controller.dart';

const ksHorizontalSpace15 = 15.0;
const ksVerticalSpace15 = 15.0;

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loginScreenFormKey = GlobalKey<FormState>();

    return WillPopScope(
        onWillPop: () async {
          return await Get.offAllNamed(Routes.welcomeScreen);
        },
        child: Scaffold(
          backgroundColor: AppColors.kcPrimaryColor,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ksWidgetHorizontalSpace15,
                      vertical: ksWidgetVerticalSpace15),
                  child: Form(
                      key: controller.loginScreenFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: ksBodyHorizontalSpace30),
                            InkWell(
                                onTap: () =>
                                    Get.offAllNamed(Routes.welcomeScreen),
                                child: Image.asset(AppAssets.icWhiteBack,
                                    width: 25, height: 25)),
                            const SizedBox(height: ksBodyHorizontalSpace30),
                            Text(R.strings.ksWelcomeBack,
                                style: AppStyles.txt32sizeWithW700),
                            SizedBox(height: Get.height * 0.001),
                            Text(R.strings.ksGladToSeeYou,
                                style: AppStyles.txt14sizeW600ckcWhite
                                    .copyWith(fontSize: 18)),
                            SizedBox(height: Get.height * 0.04),
                            buildEmailField(),
                            const SizedBox(height: ksVerticalSpace15),
                            buildPasswordField(),
                            const SizedBox(height: ksVerticalSpace15),
                            forgotPasswordComponent(),
                            SizedBox(height: Get.height * 0.05),
                            AppButton(
                                onTap: () => controller.loginValidation(),
                                btnText: R.strings.ksLoginButtonText),
                            SizedBox(height: Get.height * 0.03),
                            dontHaveAnAccountComponent(),
                            SizedBox(height: Get.height * 0.05),
                            const CommonLogo()
                          ])))),
        ));
  }

  forgotPasswordComponent() {
    return Align(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () => Get.toNamed(Routes.forgetPasswordScreen),
            child: Text(R.strings.ksForgotPassword,
                style: AppStyles.txt14sizeWithW600Underline)));
  }

  dontHaveAnAccountComponent() {
    return Center(
        child: RichText(
            text: TextSpan(
                text: "${R.strings.ksDontHaveAnAccount} ",
                style: AppStyles.txt14sizeW600ckcWhite,
                children: <TextSpan>[
          TextSpan(
              text: R.strings.ksSignUp,
              style: AppStyles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.signupScreen);
                })
        ])));
  }

  buildEmailField() {
    return AppTextField(
        isScreenTitle: true,
        hintText: R.strings.ksEmailOrPassword,
        onChanged: (value) {},
        errorText: "",
        validator: Validator.validateEmail,
        textEditingController: controller.emailTextEditingController,
        keyBoardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none);
  }

  buildPasswordField() {
    return Obx(() {
      return AppTextField(
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          isPwd: controller.isShowPassword.value ? false : true,
          maxLines: 1,
          suffixIconPath: controller.isShowPassword.value
              ? AppAssets.passwordHide
              : AppAssets.passwordShow,
          onSuffixIconTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          onTap: () {},
          validator: Validator.passwordValid,
          textEditingController: controller.passwordTextEditingController,
          hintText: R.strings.ksPassword,
          onChanged: (value) {});
    });
  }
}
