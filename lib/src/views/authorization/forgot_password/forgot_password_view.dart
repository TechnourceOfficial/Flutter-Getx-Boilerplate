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
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/validator.dart';
import '../../../../global/widgets/custom_text_field.dart';
import '../../../../global/widgets/vector_description_widget.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.forgotPwdFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ksBodyHorizontalSpace15,
                    vertical: ksBodyVerticalSpace15),
                child: Form(
                    key: controller.forgotPwdFormKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VectorDescriptionWidget(
                              imagePath: R.assets.forgotPasswordVector,
                              description: R.strings.ksForgotPasswordParaText),
                          buildEmailField(),
                          SizedBox(height: Get.height * 0.04),
                          AppButton(
                              onTap: () => controller.validAll(),
                              btnText: R.strings.btnSend),
                          SizedBox(height: Get.height * 0.03),
                          const CommonLogo()
                        ])))));
  }

  buildEmailField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: AppTextField(
            isScreenTitle: true,
            hintText: R.strings.ksEmailHint,
            errorText: "",
            validator: Validator.validateEmail,
            textEditingController: controller.emailController,
            keyBoardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none));
  }
}
