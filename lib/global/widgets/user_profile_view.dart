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

// ignore: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/global/widgets/common_widgets.dart';
import 'package:flutter_setup/global/widgets/select_file.dart';
import 'package:get/get.dart';


class UserProfile extends StatelessWidget {
  Rx<File> selectedFile;
  RxString networkImg;

  UserProfile({Key? key, required this.selectedFile, required this.networkImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
        child: Stack(alignment: Alignment.topRight, children: [
          Obx(() => selectedFile.value.path != ""
              ? buildSelectedImg()
              : (networkImg.value != "")
                  ? buildUrlImg()
                  : buildDefaultImg()),
          buildPickImg()
        ]));
  }

  buildPickImg() {
    return InkWell(
        onTap: () {
          FilePickerController.to.openBottomSheet(
              onCamera: (file) {
                if (file != null) {
                  selectedFile.value = file;
                  Utils.logPrint(file.path.toString());
                }
              },
              isCrop: true,
              onGallery: (file) {
                if (file != null) {
                  selectedFile.value = file;
                  Utils.logPrint(file.path.toString());
                }
              });
        },
        child: Image.asset(AppAssets.icCameraIcon, height: Get.height * 0.070));
  }

  buildDefaultImg() {
    return Padding(
        padding: const EdgeInsets.only(right: 4.0, top: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: Image.asset(AppAssets.defaultAvatar,
                width: Get.height * 0.16, height: Get.height * 0.16)));
  }

  buildUrlImg() {
    return Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: networkImg.value != ""
                ? Image.network(networkImg.value,
                    width: Get.height * 0.16,
                    height: Get.height * 0.16,
                    fit: BoxFit.cover,
                    errorBuilder: (context, url, error) =>
                        BuildAvtarPlaceHolder(
                            height: Get.height * 0.16,
                            width: Get.height * 0.16))
                : BuildAvtarPlaceHolder(
                    height: Get.height * 0.16, width: Get.height * 0.16)));
  }

  buildSelectedImg() {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0, top: 12),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: Image.file(selectedFile.value,
                width: Get.height * 0.16,
                height: Get.height * 0.16,
                fit: BoxFit.cover)));
  }
}
