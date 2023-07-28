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
