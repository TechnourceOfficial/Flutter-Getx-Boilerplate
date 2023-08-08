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

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Network {
  static RxBool isInternetConnected = false.obs;
  static Network? instance;

  static Network? getInstance() {
    instance ??= Network._();
    return instance;
  }

  Network._() {
    Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    Logger.logPrint("result_connectionStatus $result");
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      isInternetConnected.value = true;
      Logger.logPrint("result_connectionStatus 26 $result");
    } else if (result == ConnectivityResult.none) {
      isInternetConnected.value = false;
      Logger.logPrint("result_connectionStatus 29 $result");
    }
    Logger.logPrint("isInternetConnected $isInternetConnected");
  }

  static isNetworkConnected() {
    if (!isInternetConnected.value) {
      noInternetMessage(formHere: "isNetworkConnected()");
    }
    return isInternetConnected;
  }

  static void noInternetMessage({String? formHere}) {
    Utils.errorSnackBar(message: R.strings.ksPleaseCheckInternet);
  }
}
