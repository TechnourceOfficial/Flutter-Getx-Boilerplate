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
import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//This is common app bar for different pages of same style and pattern
class CommonWhiteAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String title;
  final AppBar appBar;
  final VoidCallback? onTap;
  final List<Widget>? actionWidgets;
  final TabBar? tabBar;
  final double? height;
  final TextStyle? style;
  final Color? statusBarColor;
  final bool? isLeading, isWhiteBack;
  final double? elevation;

  /// you can add more fields that meet your needs

  const CommonWhiteAppbar(
      {super.key,
      required this.title,
      required this.appBar,
      this.actionWidgets,
      this.elevation,
      this.statusBarColor,
      this.backgroundColor,
      this.onTap,
      this.tabBar,
      this.style,
      this.height,
      this.isLeading,
      this.isWhiteBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: buildSystemUiOverlayStyle(),
        elevation: elevation ?? 0,
        leadingWidth: Get.width * 0.09,
        automaticallyImplyLeading: false,
        title: Text(title,
            style: style ??
                AppStyles.txt18sizeW600White.merge(const TextStyle(
                    color: AppColors.kcPrimaryColor,
                    fontWeight: FontWeight.w700)),
            textAlign: TextAlign.center),
        backgroundColor: backgroundColor ?? AppColors.kcWhite,
        actions: actionWidgets,
        bottom: tabBar,
        leading: isLeading == true
            ? null
            : GestureDetector(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.05),
                    child: SvgPicture.asset(AppAssets.icBack,
                        color: isWhiteBack == true
                            ? AppColors.kcWhite
                            : AppColors.kcBlack))),
        centerTitle: true);
  }

  SystemUiOverlayStyle buildSystemUiOverlayStyle() {
    return SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.kcWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light);
  }

  @override
  Size get preferredSize => Size.fromHeight(height == null
      ? appBar.preferredSize.height
      : appBar.preferredSize.height * 2);
}
