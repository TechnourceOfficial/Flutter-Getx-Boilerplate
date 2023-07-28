
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
import 'package:get/get.dart';

import '../constant/resources/import_resources.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final String? imgPath;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;

  final int? maxLength;
  final TextInputType keyBoardType;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onSuffixIconTap;
  final GestureTapCallback? onPrefixIconTap;
  final bool? isPwd;
  final TextInputAction? inputAction;
  final bool? isReadOnly;
  final bool? isScreenTitle;
  final bool? alignEnd;

  final String? title;
  final TextStyle? textStyle;
  final Color? cursorcolor;
  final FormFieldValidator<String?>? validator;
  final List<TextInputFormatter>? inputFormatter;
  final Color? fillColor;
  final double? borderRadius;
  final double? suffixIconHeight;
  final double? suffixIconWidth;

  final Color? borderColor;

  const AppTextField(
      {Key? key,
      this.maxLength,
      required this.hintText,
      this.fillColor,
      this.errorText,
      this.onFieldSubmitted,
      this.initialValue,
      this.inputAction,
      this.onChanged,
      this.cursorcolor,
      this.textEditingController,
      this.focusNode,
      this.minLines,
      this.maxLines,
      this.alignEnd,
      required this.keyBoardType,
      this.onTap,
      required this.textCapitalization,
      this.suffixIconPath,
      this.prefixIconPath,
      this.inputFormatter,
      this.onSuffixIconTap,
      this.onPrefixIconTap,
      this.isPwd,
      this.isReadOnly,
      this.isScreenTitle,
      this.title,
      this.textStyle,
      this.borderRadius,
      this.borderColor,
      this.validator,
      this.suffixIconHeight,
      this.suffixIconWidth,
      this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Column(children: [
        isScreenTitle ?? false
            ? Row(children: [
                Text(title ?? "", style: AppStyles.txt12sizeW600ColorPrimary)
              ])
            : const SizedBox(),
        Container(
            child: textEditingController != null
                ? TextFormField(
                    maxLength: maxLength,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: textEditingController,
                    keyboardType: keyBoardType,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onTap: onTap,
                    minLines: minLines ?? 1,
                    maxLines: maxLines ?? 1,
                    onChanged: onChanged,
                    inputFormatters: inputFormatter,
                    cursorColor: cursorcolor ?? AppColors.kcWhite,
                    onFieldSubmitted: onFieldSubmitted,
                    textCapitalization: textCapitalization,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: inputAction ?? TextInputAction.next,
                    validator: validator,
                    style: textStyle ??
                        const TextStyle(fontSize: 14, color: AppColors.kcWhite),
                    readOnly: isReadOnly ?? false,
                    obscureText: isPwd ?? false,
                    decoration: buildInputDecoration())
                : TextFormField(
                    maxLength: maxLength,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    // focusNode: focusNode,
                    inputFormatters: inputFormatter,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: keyBoardType,
                    initialValue: initialValue ?? "",
                    onChanged: onChanged,
                    maxLines: maxLines ?? 1,
                    onTap: onTap,
                    cursorColor: cursorcolor ?? AppColors.kcWhite,
                    onFieldSubmitted: onFieldSubmitted,
                    textCapitalization: textCapitalization,
                    textInputAction: inputAction ?? TextInputAction.next,
                    readOnly: isReadOnly ?? false,
                    style: textStyle ??
                        const TextStyle(fontSize: 14, color: AppColors.kcWhite),
                    validator: validator,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: isPwd ?? false,
                    decoration: buildInputDecoration()))
      ]))
    ]);
  }

  buildInputDecoration() {
    return InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? Get.height * 0.01)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.kcTransparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? Get.height * 0.01)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.kcTransparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? Get.height * 0.01)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.kcTransparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? Get.height * 0.01)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.kcTransparent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? Get.height * 0.01)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.kcTransparent)),
        suffixIconConstraints:
            const BoxConstraints(maxWidth: 40, maxHeight: 50, minHeight: 50),
        suffixIcon: suffixIconPath != null
            ? buildSuffixIcon()
            : const SizedBox(height: 35, width: 1),
        prefixIconConstraints:
            const BoxConstraints(maxWidth: 60, maxHeight: 50, minHeight: 50),
        prefixIcon: prefixIconPath != null
            ? buildPrefixIcon()
            : const SizedBox(height: 35, width: 10),
        errorMaxLines: 2,
        filled: true,
        errorText: (errorText != "") ? errorText : null,
        fillColor: fillColor ?? AppColors.kcCaptionLightGray.withOpacity(0.2),
        hintStyle: AppStyles.txt14sizeW500CaptionLightGray,
        errorStyle:
            AppStyles.txt10sizeWithW500.copyWith(color: AppColors.kcRed),
        hintText: hintText);
  }

  buildPrefixIcon() {
    return InkWell(
        onTap: onPrefixIconTap,
        child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
                padding: EdgeInsets.only(
                    right: alignEnd ?? false ? 0 : 0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(prefixIconPath!,
                              height: 20, width: 20)),
                      SizedBox(width: Get.width * 0.02)
                    ]))));
  }

  buildSuffixIcon() {
    return InkWell(
        onTap: onSuffixIconTap,
        child: Padding(
            padding: EdgeInsets.only(
                top: 10, right: alignEnd ?? false ? 0 : 10, bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(suffixIconPath!,
                      fit: BoxFit.contain,
                      height: suffixIconHeight ?? 20,
                      width: suffixIconWidth ?? 20)
                ])));
  }
}
