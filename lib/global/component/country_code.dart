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

import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/global/component/country_item.dart';

class CountryCodePicker {
  static var countryList = <CountryItem>[].obs;
  static var searchResult = <CountryItem>[].obs;
  static Rx<CountryItem> selectedCoundtry = CountryItem().obs;
  static var searchController = TextEditingController();
  static var searchFocusNode = FocusNode();
  static RxBool isSearch = false.obs;
  static ValueChanged<dynamic>? onItemClick;

  static void openCountryBottomSheet(
      {required RxList<CountryItem> countrys,
      ValueChanged<dynamic>? onSelect}) {
    searchController.clear();
    searchResult.clear();
    onItemClick = onSelect;
    countryList = countrys;
    Get.bottomSheet(
        FractionallySizedBox(
            heightFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Center(
                        child: Text(R.strings.ksSelectCountryCode,
                            style: Get.textTheme.headlineSmall!
                                .merge(const TextStyle(color: Colors.white))))),
                Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ListTile(
                                  leading: Icon(Icons.search,
                                      color: Get.theme.primaryColor),
                                  horizontalTitleGap: 0.0,
                                  title: TextField(
                                      cursorColor: Get.theme.primaryColor,
                                      controller: searchController,
                                      focusNode: searchFocusNode,
                                      style: Get.textTheme.bodyMedium!.merge(
                                          TextStyle(
                                              color: Get.theme.primaryColor)),
                                      decoration: InputDecoration(
                                          hintText: R.strings.ksSearch,
                                          border: InputBorder.none,
                                          hintStyle: Get.textTheme.bodyMedium!
                                              .merge(TextStyle(
                                                  color:
                                                      Get.theme.primaryColor))),
                                      onChanged: onSearchTextChanged),
                                  dense: true))
                        ])),
                Expanded(
                    child: Obx(() => searchResult.isNotEmpty ||
                            countryList.isNotEmpty
                        ? searchResult.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ListView.separated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                          thickness: 1,
                                          color: AppColors.kcPrimaryColor
                                              .withOpacity(0.2));
                                    },
                                    itemCount: searchResult.length,
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return countryItem(
                                          country: searchResult[index]);
                                    })
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ListView.separated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                          thickness: 1,
                                          color: AppColors.kcPrimaryColor
                                              .withOpacity(0.2));
                                    },
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: countryList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return countryItem(
                                          country: countryList[index]);
                                    }))
                        : Center(child: Text(R.strings.ksNoDataFound))))
              ]
            )),
        elevation: 20.0,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor:
            Get.isDarkMode ? Get.theme.colorScheme.background : Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        )));
  }

  static onSearchTextChanged(String text) async {
    debugPrint(countryList.length.toString());
    searchResult.clear();
    if (text.isEmpty) {
      isSearch.value = false;
      return;
    }
    isSearch.value = true;

    for (var country in countryList) {
      if (country.name!.toLowerCase().contains(text.toLowerCase()) ||
          country.phoneCode!
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          country.code!.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(country);
      }
    }
    Logger.logPrint(searchResult.length.toString());
  }

  static countryItem({required CountryItem country}) {
    return CountryItemView(
        country: country,
        onTap: () {
          Get.back();
          onItemClick!(country);
        });
  }
}

class CountryItemView extends StatelessWidget {
  final CountryItem country;
  final GestureTapCallback? onTap;

  const CountryItemView({Key? key, required this.country, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(children: [
              Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AppColors.kcLightGray, width: 0.2)),
                        child: SizedBox(
                            width: 50,
                            height: 30,
                            child: Center(
                                child: Icon(Icons.outlined_flag_sharp,
                                    color: Colors.red.withOpacity(0.7)))))),
                Expanded(
                    child: Row(children: [
                  Text('+ ${country.phoneCode!} - ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  Expanded(
                      child: Text('${country.name!} (${country.code!}) ',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)))
                ]))
              ])
            ])));
  }
}
