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

import 'dart:developer' as logging;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static logPrint(String msg) {
    logging.log("fromLog: $msg");
  }

  /// When we want to show error to the user this method can be user and we also have message param
  /// so we can make it dynamic message
  static errorSnackBar({String title = 'Error', required String message}) {
    Get.log("[$title] $message", isError: true);
    if (message != "" && message != "{}") {
      return Get.showSnackbar(GetSnackBar(
          messageText: Text(message,
              style: Get.textTheme.bodySmall!
                  .merge(const TextStyle(color: Colors.white))),
          snackPosition: SnackPosition.BOTTOM,
          margin:
              EdgeInsets.only(bottom: Get.height * 0.15, right: 20, left: 20),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          duration: const Duration(seconds: 3)));
    }
  }
  /// When we want to show success message to the user this method can be user and we also have message param
  /// so we can make it dynamic message
  static successSnackBar({String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    if (message != "" && message != "{}") {
      return Get.showSnackbar(GetSnackBar(
          messageText: Text(message,
              style: Get.textTheme.bodySmall!
                  .merge(const TextStyle(color: Colors.white))),
          snackPosition: SnackPosition.BOTTOM,
          margin:
              EdgeInsets.only(bottom: Get.height * 0.15, right: 20, left: 20),
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 3)));
    }
  }
}
