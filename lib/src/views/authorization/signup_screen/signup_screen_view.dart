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
import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/validator.dart';
import '../../../../global/widgets/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import 'controller/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  const SignupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.createAccountFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: ksBodyVerticalSpace15,
                      horizontal: ksBodyHorizontalSpace15),
                  child: Form(
                      key: controller.createAccountFormKey,
                      child: Obx(() {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: Get.height * 0.045),
                              Text(R.strings.ksWelcomeToTechnource,
                                  style: R.styles.txt32sizeWithW700),
                              SizedBox(height: Get.height * 0.001),
                              Text(R.strings.ksCreateNewAccount,
                                  style: R.styles.txt18sizeWithW600),
                              SizedBox(height: Get.height * 0.04),
                              buildTextField(
                                  hintText: R.strings.ksNameHint,
                                  textEditingController:
                                      controller.firstNameTextEditingController,
                                  validator: Validator.validateFirstName),
                              buildTextField(
                                  hintText: R.strings.ksLNameHint,
                                  textEditingController:
                                      controller.lastNameTextEditingController,
                                  validator: Validator.validLastName),
                              buildTextField(
                                  hintText: R.strings.ksEmailHint,
                                  inputType: TextInputType.emailAddress,
                                  textEditingController:
                                      controller.emailTextEditingController,
                                  validator: Validator.validateEmail),
                              buildTextField(
                                  hintText: R.strings.ksUserNameHint,
                                  textEditingController:
                                      controller.usernameTextEditingController,
                                  validator: Validator.validateUserName),
                              buildPhoneField(),
                              buildPwdField(
                                  textEditingController:
                                      controller.passwordTextEditingController,
                                  hintText: R.strings.ksNewPassHint,
                                  validator: Validator.validateNewPassword,
                                  isPwd: controller.isPwdVisible),
                              buildPwdField(
                                  textEditingController: controller
                                      .confirmPasswordTextEditingController,
                                  hintText: R.strings.ksConfirmPassHint,
                                  validator: (v) {
                                    if (v!.isEmpty) {
                                      return R.validation.ksEmptyPassword;
                                    } else if (controller
                                            .passwordTextEditingController.text
                                            .toString()
                                            .trim() !=
                                        v.toString().trim()) {
                                      return R.validation.ksConfirmPassError;
                                    } else {
                                      return null;
                                    }
                                  },
                                  isPwd: controller.isConPwdVisible),
                              buildAcceptTermsConditions(),
                              SizedBox(height: Get.height * 0.04),
                              AppButton(
                                  btnText: R.strings.ksSignup,
                                  onTap: () => controller.validAll()),
                              SizedBox(height: Get.height * 0.04),
                              alreadyHaveAnAccountComponent(),
                              SizedBox(height: Get.height * 0.03),
                              const CommonLogo()
                            ]);
                      })))),
        ));
  }

  buildAcceptTermsConditions() {
    return Row(children: [
      checkBox(checkboxValue: controller.termAndConditionCheckBox),
      SizedBox(width: Get.width * 0.01),
      bySigningUpYouComponent()
    ]);
  }

  alreadyHaveAnAccountComponent() {
    return Center(
        child: RichText(
            text: TextSpan(
                text: "${R.strings.ksAlreadyHaveAnAccount} ",
                style: R.styles.txt14sizeW600ckcWhite,
                children: <TextSpan>[
          TextSpan(
              text: R.strings.ksLogin,
              style: R.styles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.loginScreen);
                })
        ])));
  }

  checkBox({required RxBool checkboxValue}) {
    return SizedBox(
        width: 22,
        height: 22,
        child: Obx(() => Checkbox(
            value: checkboxValue.value,
            onChanged: (value) {
              checkboxValue.value = !checkboxValue.value;
              controller.isAcceptPolicy.value = checkboxValue.value;
            },
            activeColor: R.colors.kcPrimaryColor,
            side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 1.0, color: R.colors.kcWhite)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)))));
  }

  bySigningUpYouComponent() {
    return Flexible(
        child: RichText(
            text: TextSpan(
                text: "${R.strings.ksBySigningUpYou} ",
                style: R.styles.txt10sizeWithW500,
                children: <TextSpan>[
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: R.strings.ksTermsAndConditions,
              style:
                  R.styles.txt14sizeWithW600Underline.copyWith(fontSize: 10)),
          TextSpan(
              text: " ${R.strings.ksAnd} ", style: R.styles.txt10sizeWithW500),
          TextSpan(
              text: R.strings.ksPrivacyPolicy,
              style: R.styles.txt14sizeWithW600Underline.copyWith(fontSize: 10),
              recognizer: TapGestureRecognizer()..onTap = () {})
        ])));
  }

  buildTextField(
      {required String hintText,
      required TextEditingController textEditingController,
      FormFieldValidator<String?>? validator,
      TextInputType? inputType,
      bool? isReadOnly,
      GestureTapCallback? onTap}) {
    return Padding(
        padding: EdgeInsets.only(right: 2, bottom: Get.height * 0.02),
        child: AppTextField(
            onTap: onTap,
            isReadOnly: isReadOnly ?? false,
            maxLines: 1,
            fillColor: R.colors.kcInputFilled,
            cursorcolor: R.colors.kcWhite,
            textStyle: R.styles.txt14sizeW600ckcWhite,
            hintText: hintText,
            errorText: "",
            textEditingController: textEditingController,
            validator: validator,
            inputAction: TextInputAction.next,
            keyBoardType: inputType ?? TextInputType.text,
            textCapitalization: TextCapitalization.sentences));
  }

  buildPhoneField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 22,
              child: buildTextField(
                  onTap: () {
                    controller.openCountryBottomSheet();
                  },
                  hintText: R.strings.ksCountryCodeHint,
                  textEditingController: controller.countryCodeController,
                  isReadOnly: true)),
          SizedBox(width: Get.width * 0.03),
          Expanded(
              flex: 73,
              child: buildTextField(
                  hintText: R.strings.ksPhoneHint,
                  textEditingController: controller.contactNumberController,
                  validator: Validator.validNumber,
                  inputType: TextInputType.phone))
        ]));
  }

  buildPwdField(
      {required String hintText,
      required TextEditingController textEditingController,
      RxBool? isPwd,
      FormFieldValidator<String?>? validator}) {
    return Obx(() {
      return Padding(
          padding: EdgeInsets.only(right: 2, bottom: Get.height * 0.02),
          child: AppTextField(
              maxLines: 1,
              hintText: hintText,
              fillColor: R.colors.kcInputFilled,
              errorText: "",
              inputFormatter: Validator.nameFormatterWithSpecialChar,
              textEditingController: textEditingController,
              validator: validator,
              isPwd: isPwd!.value ? false : true,
              cursorcolor: R.colors.kcWhite,
              textStyle: R.styles.txt14sizeW600ckcWhite,
              suffixIconPath:
                  isPwd.value ? R.assets.passwordHide : R.assets.passwordShow,
              onSuffixIconTap: () {
                isPwd.value = !isPwd.value;
              },
              inputAction: TextInputAction.next,
              keyBoardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none));
    });
  }
}
