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

// ignore_for_file: constant_identifier_names

import 'package:flutter_setup/src/views/authorization/login_screen/login_screen_view.dart';
import 'package:flutter_setup/src/views/home_page/views/home_view.dart';
import 'package:get/get.dart';

import '../views/authorization/login_screen/binding/login_screen.dart';
import '../views/authorization/select_language_screen/binding/select_language_screen.dart';
import '../views/authorization/select_language_screen/select_language_screen_view.dart';
import '../views/authorization/splash/bindings/splash_binding.dart';
import '../views/authorization/splash/views/splash_view.dart';
import '../views/home_page/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashView(),
        transition: Transition.downToUp,
        binding: SplashBinding()),
    GetPage(
        name: Routes.selectLanguage,
        page: () => const SelectLanguageScreenView(),
        transition: Transition.downToUp,
        binding: SelectLanguageBinding()),
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreenView(),
        transition: Transition.downToUp,
        binding: LoginScreenBinding()),
    GetPage(
        name: Routes.homeScreen,
        page: () => HomeView(),
        transition: Transition.downToUp,
        binding: HomeViewBinding())
  ];
}
