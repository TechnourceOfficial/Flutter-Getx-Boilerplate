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
import 'package:flutter_setup/src/views/home_page/component/search_field.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/src/views/home_page/controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
   HomePageView({super.key});
  final HomePageController homePageController =
  Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        child: Scaffold(
            backgroundColor: AppColors.kcWhite,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: ksBodyVerticalSpace15,
                            horizontal: ksBodyHorizontalSpace15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildImage(
                                          imgPath: AppAssets.icTechnourceLogo),
                                      controller.isSearch.value
                                          ? Expanded(
                                              child: CommonSearchBar(
                                                  onPrefixTap: () => controller
                                                      .isSearch.value = false))
                                          : InkWell(
                                              onTap: () => controller
                                                  .isSearch.value = true,
                                              child: buildImage(
                                                  imgPath:
                                                      AppAssets.icSearchIcon))
                                    ]);
                              })
                            ]))))));
  }

  buildImage({required String imgPath}) {
    return Image.asset(imgPath,
        height: Get.height * 0.06, width: Get.width * 0.08);
  }
}
