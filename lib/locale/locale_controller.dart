import 'package:flutter/Cupertino.dart';
import 'package:get/get.dart';
import '../main.dart';

class MyLocaleController extends GetxController {
  Locale intialLang =
      sharedpref.getString("lang") == "ar" ? Locale("ar") : Locale("en");

  void changeLang(String codelang) async {
    Locale locale = Locale(codelang);
    await sharedpref.setString("lang", codelang);

    Get.updateLocale(locale);
  }
}
