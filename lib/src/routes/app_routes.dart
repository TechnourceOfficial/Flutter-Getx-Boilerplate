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

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onBoard = _Paths.onBoard;
  static const selectLanguage = _Paths.selectLanguage;
  static const welcomeScreen = _Paths.welcomeScreen;
  static const loginScreen = _Paths.loginScreen;
  static const signupScreen = _Paths.signupScreen;
  static const forgetPasswordScreen = _Paths.forgetPasswordScreen;
  static const otpScreen = _Paths.otpScreen;
  static const dashboardScreen = _Paths.dashboardScreen;

  static const homeScreen = _Paths.homeScreen;
  static const settingScreen = _Paths.settingScreen;
  static const editProfileScreen = _Paths.editProfileScreen;
  static const moreScreen = _Paths.moreScreen;
  static const termsPrivacyScreen = _Paths.termsPrivacyScreen;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onBoard = '/onBoard';
  static const selectLanguage = '/selectLanguage';
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const otpScreen = '/otpScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const homeScreen = '/homeScreen';
  static const settingScreen = '/settingScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const moreScreen = '/moreScreen';
  static const termsPrivacyScreen = '/termsPrivacyScreen';
}
