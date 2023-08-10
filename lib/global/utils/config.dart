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

import 'package:get/get.dart';

class Config {
  static var appName = 'Flutter BoilerPlate';

  static String termsAndCondition =
      "https://www.technource.com/terms-conditions/";
  static String privacyPolicyUrl = "https://technource.com/privacy-policy/";
  static String aboutUsUrl = "https://www.technource.com/services/";

  static RxString setLocale = 'en'.obs;

  static String langCodeEn = 'en';
  static String langCodeRu = 'ru';
  static String langCodeFr = 'fr';

  static String langCountryCodeEn = 'US';
  static String langCountryCodeRu = 'RU';
  static String langCountryCodeFr = 'CA';
  static String githubRepoLink = 'https://github.com/TechnourceOfficial/Flutter-Getx-Boilerplate';

  static String cmsPrivacyPolicy = "privacy-policy";
  static String cmsTermsCondition = "terms-conditions";
  static String cmsAboutUsUrl = "about-us";

  //Arguments
  static const String argSlug = "argCms";
}
