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

import 'package:flutter_setup/global/utils/config.dart';

class GetLanguageListModel {
  GetLanguageListModel({
    this.message,
    this.data,
    this.code,
  });

  GetLanguageListModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LanguageData.fromJson(v));
      });
    }
    code = json['code'];
  }

  String? message;
  List<LanguageData>? data;
  num? code;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    return map;
  }
}

class LanguageData {
  LanguageData({
    this.langId,
    this.langCode,
    this.langName,
  });

  LanguageData.fromJson(dynamic json) {
    langId = json['lang_id'];
    langCode = json['lang_code'];
    langName = json['lang_name'];
  }

  String? langId;
  String? langCode;
  String? langName;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lang_id'] = langId;
    map['lang_code'] = langCode;
    map['lang_name'] = langName;
    return map;
  }
}

List<LanguageData> getLanguages() {
  return [
    LanguageData(langId: '1', langName: 'English', langCode: Config.langCodeEn),
    LanguageData(langId: '2', langName: 'French', langCode: Config.langCodeFr),
    LanguageData(langId: '3', langName: 'Russian', langCode: Config.langCodeRu)
  ];
}
