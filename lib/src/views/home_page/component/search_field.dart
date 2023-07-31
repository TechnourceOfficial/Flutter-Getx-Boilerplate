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
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class CommonSearchBar extends StatelessWidget {
  final GestureTapCallback? onPrefixTap;
  final Widget? prefix;
  final GestureTapCallback? onSuffixTap;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? editingComplete;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CommonSearchBar(
      {Key? key,
      this.onFieldSubmitted,
      this.prefix,
      this.controller,
      this.editingComplete,
      this.onPrefixTap,
      this.onSuffixTap,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.done,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: editingComplete,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: R.strings.ksSearchText,
            contentPadding: const EdgeInsets.only(right: 9, top: 9, bottom: 9),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: IconButton(
                onPressed: onSuffixTap,
                icon: Image.asset(AppAssets.icSearchIcon,
                    height: Get.width * 0.05)),
            prefixIcon: IconButton(
                onPressed: onPrefixTap,
                icon: const Icon(Icons.arrow_back_ios_new,
                    size: 20, color: AppColors.kcBlack)),
            errorMaxLines: 2));
  }
}
