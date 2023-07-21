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
import '../../../../../global/component/country_code.dart';
import '../../../../../global/component/country_item.dart';
import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/utils/utils.dart';

class SignupScreenController extends GetxController {
  static SignupScreenController get to => Get.put(SignupScreenController());
  RxBool termAndConditionCheckBox = false.obs,
      isAcceptPolicy = false.obs,
      isPwdVisible = false.obs,
      isConPwdVisible = false.obs;
  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  late GlobalKey<FormState> createAccountFormKey;
  var firstNameTextEditingController = TextEditingController(),
      lastNameTextEditingController = TextEditingController(),
      emailTextEditingController = TextEditingController(),
      usernameTextEditingController = TextEditingController(),
      passwordTextEditingController = TextEditingController(),
      confirmPasswordTextEditingController = TextEditingController(),
      countryCodeController = TextEditingController(),
      contactNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    countryCodeController.text = "+32";
  }

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  validAll() {
    if (createAccountFormKey.currentState!.validate()) {
      debugPrint("validate");

      if (isAcceptPolicy.value == true) {
        Get.offAllNamed(Routes.loginScreen);
      } else {
        debugPrint("in Else");
        Utils.errorSnackBar(
          message: R.strings.ksAcceptTermAndConditionError,
        );
      }
    } else {
      debugPrint("Invalidate");
    }
  }

  void openCountryBottomSheet() {
    CountryCodePicker.openCountryBottomSheet(
        countrys: countryList,
        onSelect: (country) {
          countryCodeController.text = "+${country.phoneCode!}";
          selectedCont.value = country;
        });
  }
}
