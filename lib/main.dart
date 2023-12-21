import 'package:apothecary/view/TapBar.dart';
import 'package:apothecary/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';

import 'view/HomePage.dart';
import 'view/login.dart';
import 'view/signup.dart';

late SharedPreferences sharedpref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerlan =
        Get.put<MyLocaleController>(MyLocaleController());
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      locale: controllerlan.intialLang,
      translations: MyLocale(),
      theme: sharedpref.getBool("isdark") == true
          ? ThemeData.dark()
          : ThemeData.light(),
      getPages: [
        GetPage(name: "/", page: () => Splash()),
        GetPage(name: "/Login", page: () => Login()),
        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/HomePage", page: () => HomePage()),
        GetPage(name: "/TapBar", page: () => MyTapBar()),
      ],
    );
  }
}
