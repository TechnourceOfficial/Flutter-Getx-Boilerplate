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
  String get btnYes => 'btn_yes'.toTranslate();

  String get btnNo => 'btn_no'.toTranslate();

  String get btnNext => 'btn_next'.toTranslate();

  String get hnSelectLanguage => 'hn_select_language'.toTranslate();

  ///Login Screen
  String get ksWelcomeBack => 'welcomeBack'.toTranslate();

  String get ksGladToSeeYou => 'glad_to_see_you'.toTranslate();

  String get ksEmailOrPassword => 'email_or_password'.toTranslate();

  String get ksPassword => 'password'.toTranslate();

  String get ksForgotPassword => 'forgot_password'.toTranslate();

  String get ksOrLoginWith => 'or_login_with'.toTranslate();

  String get ksDontHaveAnAccount => 'dont_have_an_account'.toTranslate();

  String get ksSignUp => 'sign_up'.toTranslate();

  String get ksLoginButtonText => 'login_button_text'.toTranslate();

  String get scLoginMsg => 'login_success_message'.toTranslate();

  String get erSelectLanguageMsg => 'select_language_error'.toTranslate();

  ///Signup Screen
  String get ksWelcomeToTechnource => 'welcome_to_technource'.toTranslate();

  String get ksCreateNewAccount => 'create_new_account'.toTranslate();

  String get ksBySigningUpYou => 'by_signing_up_you'.toTranslate();

  String get ksAnd => 'and'.toTranslate();

  String get ksTermsAndConditions => 'terms_and_conditions'.toTranslate();

  String get ksPrivacyPolicy => 'privacy_policy'.toTranslate();

  String get ksAlreadyHaveAnAccount => 'already_have_an_account'.toTranslate();

  String get ksLogin => 'log_in'.toTranslate();

  String get ksSignup => 'sign_up_button'.toTranslate();

  String get ksAcceptTermAndConditionError =>
      'accept_privacy_policy_error_text'.toTranslate();

  String get ksEmailHint => 'email_hint'.toTranslate();

  String get ksNameHint => 'name_hint'.toTranslate();

  String get ksLNameHint => 'lastname_hint'.toTranslate();

  String get ksUserNameHint => 'username_hint'.toTranslate();

  String get ksCountryCodeHint => 'country_code_hint'.toTranslate();

  String get ksPhoneHint => 'phone_hint'.toTranslate();

  String get ksAddressHint => 'address_hint'.toTranslate();

  String get ksOfficeAddressHint => 'office_address_hint'.toTranslate();

  String get ksNewPassHint => 'new_pass_hint'.toTranslate();

  String get ksConfirmPassHint => 'confirm_pass_hint'.toTranslate();

  String get ksSelectCountryCode => 'select_country_code'.toTranslate();

  String get ksSearch => 'search_text'.toTranslate();

  String get ksNoDataFound => 'no_data_found'.toTranslate();

  String get ksForgotPasswordParaText => 'forgot_password_para'.toTranslate();

  String get btnSend => 'btn_send'.toTranslate();

  ///Otp Screen
  String get ksWeHaveSentAn => 'we_have_sent_you_an_account'.toTranslate();

  String get ksEnterTheCode => 'enter_the_code'.toTranslate();

  String get ksCodeHasBeenSend => 'code_has_been_send_to_your'.toTranslate();

  String get ksVerify => 'verify'.toTranslate();

  String get ksDontReceiveTheOtp => 'dont_receive_the_otp'.toTranslate();

  String get ksResendOtp => 'resend_otp'.toTranslate();

  String get ksOTPVerification => 'otp_verification'.toTranslate();

  ///OnBoard

  String get ksTitle => 'title_text'.toTranslate();

  String get ksDescription => 'description_text'.toTranslate();

  String get ksSkip => 'intro_skip'.toTranslate();

  String get ksNext => 'intro_next'.toTranslate();

  String get ksBottomMenu => 'menu_text'.toTranslate();

  String get ksExitApp => 'exit_app'.toTranslate();

  String get ksSearchText => 'search_text'.toTranslate();

  get ksChangeLanguage => 'change_language'.toTranslate();

  get ksGitHub => 'github_text'.toTranslate();

  /// Drawer HomePage
  String get ksMyAppointment => 'my_appointment'.toTranslate();

  String get ksReview => 'review'.toTranslate();

  String get ksPayments => 'payments'.toTranslate();

  String get ksChangePassword => 'change_password'.toTranslate();

  String get ksMore => 'more'.toTranslate();

  String get ksDeactivateAccount => 'deactivate_account'.toTranslate();

  String get ksLogOut => 'log_out'.toTranslate();

  String get ksDeleteAccount => 'delete_account'.toTranslate();

  String get ksDeleteAccountDescription =>
      'delete_account_description'.toTranslate();

  String get ksLogoutAccountDescription =>
      'logout_account_description'.toTranslate();

  String get ksDeactivateAccountDescription =>
      'deactivate_account_description'.toTranslate();

  String get ksYes => 'yes_text'.toTranslate();

  String get ksNo => 'no_text'.toTranslate();
}

/// Validation message will be added here
class AppStringsValidation {
  String get ksValidEmail => 'valid_email'.toTranslate();

  String get ksEmailError => 'please_enter_email'.toTranslate();

  String get ksEmptyPassword => 'please_enter_password'.toTranslate();

  String get ksLastNameError => 'empty_lastname'.toTranslate();

  String get ksValidLastNameError => 'enter_valid_last_name'.toTranslate();

  String get ksValidFirstNameError => 'valid_first_name'.toTranslate();

  String get ksFirstNameError => 'empty_firstname'.toTranslate();

  String get ksUserNameError => 'empty_username'.toTranslate();

  String get ksEmptyMobile => 'empty_phone_number'.toTranslate();

  String get ksValidMobile => 'valid_mobile'.toTranslate();

  String get ksConfirmPassError => 'confirm_password_error'.toTranslate();

  String get ksValidPassword => 'please_enter_valid_password'.toTranslate();

  String get ksErrorNewPassword =>
      'change_password_valid_new_password'.toTranslate();

  String get ksEnter6DigitOpt => 'enter_6_digits_otp'.toTranslate();
}
