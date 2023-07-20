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
import 'package:google_fonts/google_fonts.dart';
import '../constant/resources/resources.dart';

/// To customize the app theme need to changes things in this method
ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: R.colors.kcCaptionLightGray),
      primaryColor: R.colors.kcPrimaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: R.colors.kcPrimaryAccentColor.withOpacity(0.1),
      focusColor: R.colors.kcPrimaryAccentColor,
      hintColor: R.colors.kcDefaultText,
      colorScheme: ColorScheme.light(
          primary: R.colors.kcPrimaryColor, secondary: R.colors.kcPrimaryColor),
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme));
}
