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

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class CircleImageView extends StatelessWidget {
  final String imgUrl;
  final double? radius;
  final String? errorImage;
  final Color? backgroundColor;

  const CircleImageView(
      {Key? key,
      required this.imgUrl,
      this.radius,
      this.errorImage,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: backgroundColor ?? AppColors.kcGrey,
        radius: radius ?? 30,
        child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipOval(
                child: SizedBox.fromSize(
                    size: const Size.fromRadius(40),
                    // Image radius
                    child: Image.network(imgUrl,
                        errorBuilder: (context, url, error) =>
                            Image.asset(errorImage ?? AppAssets.defaultAvatar),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.kcWhite,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null));
                        },
                        fit: BoxFit.cover)))));
  }
}
