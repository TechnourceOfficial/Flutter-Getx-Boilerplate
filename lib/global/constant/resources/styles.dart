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
 *  Email: info@technource.in
 *  Developed by Technource (https://www.technource.com)
 */

import 'package:flutter/material.dart';
import 'resources.dart';
/// Definer text style,decoration style, card style in this file
class AppStyles {
  TextStyle txt14sizeW700ColorPrimary = TextStyle(
    fontSize: 14,
    color: R.colors.kcPrimaryColor,
    fontWeight: FontWeight.w700,
  );

  final txt16sizeW600CaptionLightGray = TextStyle(
      color: R.colors.kcCaptionLightGray,
      fontSize: 16,
      fontWeight: FontWeight.w600);

  final txt24sizeW600kcCaptionLightGray = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: R.colors.kcCaptionLightGray);
}
