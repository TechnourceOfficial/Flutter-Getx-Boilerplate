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
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/app_localization/app_localization.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_setup/global/theme/light_theme.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class FlutterBoilerPlateApp extends StatelessWidget {
  const FlutterBoilerPlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarColor: AppColors.kcPrimaryColor,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light),
            child: GetMaterialApp(
                title: Config.appName,
                locale: Locale(AppSession.getSelectedLanguageId()),
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [
                  Locale(Config.langCodeEn, Config.langCountryCodeEn),
                  Locale(Config.langCodeRu, Config.langCountryCodeRu),
                  Locale(Config.langCodeFr, Config.langCountryCodeFr)
                ],
                debugShowCheckedModeBanner: false,
                theme: lightThemeData(context),
                initialRoute: Routes.splash,
                getPages: AppPages.routes)));
  }
}
