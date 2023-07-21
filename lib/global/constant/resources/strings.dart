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

import 'package:flutter_setup/global/extention/string_extensions.dart';

/// All the text of the app will be defined here
class AppStrings {
  String get btnYes => "btn_yes".toTranslate();

  String get btnNo => "btn_no".toTranslate();

  String get btnNext => "btn_next".toTranslate();

  String get hnSelectLanguage => "hn_select_language".toTranslate();

  ///Login Screen
  String get ksWelcomeBack => "welcomeBack".toTranslate();

  String get ksGladToSeeYou => "glad_to_see_you".toTranslate();

  String get ksEmailOrPassword => "email_or_password".toTranslate();

  String get ksPassword => "password".toTranslate();

  String get ksForgotPassword => "forgot_password".toTranslate();

  String get ksOrLoginWith => "or_login_with".toTranslate();

  String get ksDontHaveAnAccount => "dont_have_an_account".toTranslate();

  String get ksSignUp => "sign_up".toTranslate();

  String get ksLoginButtonText => "login_button_text".toTranslate();

  String get scLoginMsg => "login_success_message".toTranslate();

  String get erSelectLanguageMsg => "select_language_error".toTranslate();
}

/// Validation message will be added here
class AppStringsValidation {
  String get ksValidEmail => "valid_email".toTranslate();

  String get ksEmailError => "please_enter_email".toTranslate();

  String get ksEmptyPassword => "please_enter_password".toTranslate();
}
