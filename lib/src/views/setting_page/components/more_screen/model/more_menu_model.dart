import 'package:flutter_setup/global/constant/resources/resources.dart';

class MoreMenuModel {
  String title;
  int id;

  MoreMenuModel({required this.title, required this.id});
}

List<MoreMenuModel> getMoreMenu() {
  return [
    MoreMenuModel(id: 1, title: R.strings.ksAboutUs),
    MoreMenuModel(id: 2, title: R.strings.ksTermsAndCondition),
    MoreMenuModel(id: 3, title: R.strings.ksPrivacyPolicy),
  ];
}
