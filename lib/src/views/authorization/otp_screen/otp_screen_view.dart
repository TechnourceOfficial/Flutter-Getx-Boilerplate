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
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:flutter_setup/global/widgets/vector_description_widget.dart';
import 'package:flutter_setup/src/views/authorization/otp_screen/controller/otp_controller.dart';

const ksBodyVerticalSpace10 = 10.0;
const ksWidgetVerticalSpace15 = 15.0;

class OtpScreenView extends GetView<OtpScreenController> {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.otpFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
              child: ColoredBox(
                  color: AppColors.kcPrimaryColor,
                  child: Form(
                      key: controller.otpFormKey,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: ksBodyVerticalSpace15,
                              horizontal: ksBodyHorizontalSpace15),
                          child: Column(children: [
                            VectorDescriptionWidget(
                                description: R.strings.ksWeHaveSentAn,
                                imagePath: AppAssets.otpScreen),
                            const SizedBox(height: ksBodyVerticalSpace10),
                            buildEnterCode(),
                            const SizedBox(height: ksBodyVerticalSpace10),
                            buildPinCodeTextField(),
                            buildCodeSentText(),
                            const SizedBox(height: ksWidgetVerticalSpace15),
                            buildButton(),
                            const SizedBox(height: ksWidgetVerticalSpace15),
                            buildResendOtpText(),
                            const SizedBox(height: ksWidgetVerticalSpace15),
                            const CommonLogo()
                          ]))))),
        ));
  }

  buildCodeSentText() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(R.strings.ksCodeHasBeenSend,
            style: AppStyles.txt14sizeW500CaptionLightGray));
  }

  buildEnterCode() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(R.strings.ksEnterTheCode,
            style: AppStyles.txt18sizeWithW600
                .copyWith(color: AppColors.kcWhite)));
  }

  buildResendOtpText() {
    return RichText(
        text: TextSpan(
            text: R.strings.ksDontReceiveTheOtp,
            style: AppStyles.txt14sizeW600ckcWhite,
            children: <TextSpan>[
          TextSpan(
              text: R.strings.ksResendOtp,
              style: AppStyles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()..onTap = () {})
        ]));
  }

  buildButton() {
    return AppButton(
        onTap: () {
          controller.validAll();
        },
        btnText: R.strings.ksVerify);
  }

  buildPinCodeTextField() {
    return PinCodeTextField(
        controller: controller.otpController,
        appContext: Get.context!,
        length: 6,
        textStyle: AppStyles.txt14sizeW500CaptionLightGray,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(Get.height * 0.01),
            fieldHeight: Get.height * 0.06,
            fieldWidth: Get.width * 0.13,
            activeFillColor: AppColors.kcCaptionLightGray.withOpacity(0.2),
            activeColor: AppColors.kcTransparent,
            inactiveFillColor: AppColors.kcCaptionLightGray.withOpacity(0.2),
            inactiveColor: AppColors.kcTransparent,
            selectedColor: AppColors.kcTransparent,
            selectedFillColor: AppColors.kcCaptionLightGray.withOpacity(0.2)),
        cursorColor: AppColors.kcCaptionLightGray,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          controller.otpController.text = v;
          controller.otpValidation();
        },
        validator: Validator.validOtp,
        onChanged: (value) {
          controller.otpValidation();
        },
        beforeTextPaste: (text) {
          return true;
        });
  }
}
