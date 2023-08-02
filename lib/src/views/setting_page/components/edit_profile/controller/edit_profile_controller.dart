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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/component/country_code.dart';
import 'package:flutter_setup/global/component/country_item.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';


class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  Rx<File> selectedFile = File("").obs;
  RxString networkImg = "".obs;
  RxBool isBtnDisabled = true.obs;

  late GlobalKey<FormState> editProfileFormKey;

  var emailController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      contactNumberController = TextEditingController(),
      countryCodeController = TextEditingController(),
      userNameController = TextEditingController(),
      homeAddressController = TextEditingController(),
      officeAddressController = TextEditingController();

  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  void editProfileValidation() async {
    if (editProfileFormKey.currentState!.validate()) {
      editProfileFormKey.currentState!.save();
      isBtnDisabled.value = false;
    } else {
      isBtnDisabled.value = true;
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

  Future<bool> onWillPopTap() async {
    return await Get.offAllNamed(Routes.dashboardScreen);
  }
}
