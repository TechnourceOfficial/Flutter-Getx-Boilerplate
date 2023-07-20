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
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constant/resources/resources.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  final double? height, width;

  const CustomProgressIndicatorWidget({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: R.colors.kcTransparent),
        child: Align(
            alignment: Alignment.center,
            child: Container(
                height: 100,
                constraints: const BoxConstraints.expand(width: 50, height: 50),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: FittedBox(
                    fit: BoxFit.none,
                    child: SizedBox(
                        height: height ?? Get.height * 0.2,
                        width: width ?? Get.width * 0.25,
                        child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [
                              R.colors.kcYellow,
                              R.colors.kcPrimaryColor
                            ]))))));
  }
}
