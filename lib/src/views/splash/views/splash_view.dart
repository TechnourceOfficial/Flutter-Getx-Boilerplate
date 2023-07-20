import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final SplashController splashController = Get.put(SplashController());

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: SafeArea(
            child: Stack(children: [
          splashScreenBackground(),
          splashScreenCenterComponent(),
        ])));
  }

  splashScreenBackground() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(R.assets.welcomeBg4x, fit: BoxFit.fill));
  }

  splashScreenCenterComponent() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(R.assets.appLogo,
              ))
        ]));
  }
}
