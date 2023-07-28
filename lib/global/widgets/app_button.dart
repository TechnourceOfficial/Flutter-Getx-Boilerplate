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

import '../constant/resources/import_resources.dart';


/// This is comman App button that will be used in all places where it should be match the app theme
class AppButton extends StatelessWidget {
  final double? verticlePadding;
  final Color? btnBgColor, borderColor;
  final VoidCallback? onTap;
  final String? btnText;
  final TextStyle? buttonTextStyle;

  const AppButton(
      {Key? key,
      this.verticlePadding,
      this.buttonTextStyle,
      this.borderColor,
      this.btnBgColor,
      this.btnText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        minWidth: double.infinity,
        color: btnBgColor ?? AppColors.kcYellow,
        padding:  EdgeInsets.symmetric(vertical: verticlePadding??15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? AppColors.kcTransparent)),
        child: Text(
            textAlign: TextAlign.center,
            btnText.toString(),
            style: buttonTextStyle ?? AppStyles.txt14sizeW700ColorPrimary));
  }
}
