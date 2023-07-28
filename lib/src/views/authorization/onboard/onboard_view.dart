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
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:flutter_setup/src/views/authorization/onboard/components/dot_indicator_item.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/import_resources.dart';
import 'components/page_view_item.dart';
import 'controller/onboard_controller.dart';

const ksWidgetHorizontalSpace15 = 15.0;
const ksWidgetVerticalSpace15 = 15.0;
const ksWidgetVerticalSpace40 = 40.0;

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: SafeArea(
            child: Container(
                color: AppColors.kcPrimaryColor,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: ksBodyHorizontalSpace15,
                        vertical: ksBodyVerticalSpace15),
                    child: Column(children: [
                      pageViewWidget(),
                      dotIndicatorWidget(),
                      const SizedBox(height: ksWidgetVerticalSpace15),
                      const CommonLogo()
                    ])))));
  }

  pageViewWidget() {
    return Obx(() {
      return Expanded(
          child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.changeIndicator(index: index);
              },
              itemCount: controller.onboardItemList.length,
              itemBuilder: (context, index) {
                return PageViewItem(
                    onBoardItemModel: controller.onboardItemList[index]);
              }));
    });
  }

  dotIndicatorWidget() {
    return Obx(() {
      return Row(children: [
        SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.onboardItemList.length,
                itemBuilder: (context, index) {
                  return DotIndicatorItem(
                      innerDotColor: controller.selectedIndicator.value == index
                          ? AppColors.kcWhite
                          : AppColors.kcCaptionLightGray,
                      outerDotColor: controller.selectedIndicator.value == index
                          ? AppColors.kcCaptionLightGray.withOpacity(0.3)
                          : AppColors.kcTransparent);
                })),
        const Spacer(),
        skipButton(),
        const SizedBox(width: ksWidgetHorizontalSpace15),
        nextButton()
      ]);
    });
  }

  InkWell nextButton() {
    return InkWell(
        onTap: () => controller.onNextTap(),
        child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: ksWidgetHorizontalSpace15,
                vertical: ksWidgetVerticalSpace15),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Get.width * 0.2)),
                color: AppColors.kcCaptionLightGray.withOpacity(0.2)),
            child: Center(
                child: Text(R.strings.ksNext,
                    style: AppStyles.txt18sizeWithW600
                        .copyWith(color: AppColors.kcWhite)))));
  }

  Visibility skipButton() {
    return Visibility(
      visible: controller.selectedIndicator.value !=
          controller.onboardItemList.length - 1,
      child: InkWell(
          child: Text(R.strings.ksSkip,
              style: AppStyles.txt14sizeW600ckcWhite
                  .copyWith(color: AppColors.kcYellow)),
          onTap: () => controller.skipNextTapped()),
    );
  }
}
