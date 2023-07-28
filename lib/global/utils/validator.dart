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

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';

class Validator {
  static RegExp alphaNumberRic =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static List<TextInputFormatter>? nameFormatterWithSpecialChar = [
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@#\$%^&*()_-]')),
  ];

  static List<TextInputFormatter>? mobileNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp('[0-9-_+]'))
  ];

  static String? passwordValid(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksEmptyPassword;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksEmailError;
    } else if (!GetUtils.isEmail(v.trim())) {
      return R.validation.ksValidEmail;
    } else {
      return null;
    }
  }

  static String? validateFirstName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksFirstNameError;
    } else if (v.length > 25) {
      return R.validation.ksValidFirstNameError;
    } else {
      return null;
    }
  }

  static String? validLastName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksLastNameError;
    } else if (v.length > 25) {
      return R.validation.ksValidLastNameError;
    } else {
      return null;
    }
  }

  static String? validateUserName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksUserNameError;
    } else {
      return null;
    }
  }

  static String? validNumber(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksEmptyMobile;
    } else if (v.length < 7) {
      return R.validation.ksValidMobile;
    } else if (v.length > 15) {
      return R.validation.ksValidMobile;
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksErrorNewPassword;
    } else if (!alphaNumberRic.hasMatch(v)) {
      return R.validation.ksValidPassword;
    } else {
      return null;
    }
  }

  static String? validOtp(String? v) {
    if (v!.length < 6) {
      return R.validation.ksEnter6DigitOpt;
    } else {
      return null;
    }
  }
}
