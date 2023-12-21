import 'package:apothecary/controller/LogoutController.dart';
import 'package:http/http.dart';

import '../config/user_information.dart';
import '../native_service/secure_storage.dart';
import 'package:apothecary/locale/locale_controller.dart';
import 'package:apothecary/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Drawerapp extends StatefulWidget {
  const Drawerapp({super.key});
  @override
  State<Drawerapp> createState() => _DrawerappState();
}

LogoutController controller = Get.put<LogoutController>(LogoutController());

class _DrawerappState extends State<Drawerapp> {
  SecureStorage _storage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    if (Get.isDarkMode) {
                      Get.changeTheme(ThemeData.light());
                      sharedpref.setBool("isdark", false);
                    } else {
                      Get.changeTheme(ThemeData.dark());
                      sharedpref.setBool("isdark", true);
                    }
                  },
                  icon: const Icon(Icons.brightness_medium_sharp,
                      size: 45, color: Colors.white70),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
              currentAccountPicture: const CircleAvatar(
                  child: Icon(
                Icons.person,
              )),
              //  ":التسجيل ب",
              accountName: Text(
                "24".tr,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              accountEmail: Text(
                "Aya Mk",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          ListTile(
            onTap: () {
              if (sharedpref.getString("lang") == "en") {
                controllerLang.changeLang("ar");
              } else {
                controllerLang.changeLang("en");
              }
            },
            title: Text(
              "8".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.language, color: Colors.blue),
          ),
          ListTile(
            onTap: () {},
            //"تواصل معنا",
            title: Text(
              "15".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.blue,
            ),
          ),
          ListTile(
            onTap: () {},
            //"مشاركة التطبيق ",
            title: Text(
              "19".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.share, color: Colors.blue),
          ),
          ListTile(
            onTap: () {},
            // "المعلومات الشخصية ",
            title: Text(
              "20".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.person, color: Colors.blue),
          ),
          ListTile(
            onTap: () {},
            // "سياسة الخصوصية "
            title: Text(
              "21".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.person_search, color: Colors.blue),
          ),
          ListTile(
            onTap: () {},
            // "عناوين الاستلام",
            title: Text(
              "22".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.location_on, color: Colors.blue),
          ),
          ListTile(
            onTap: () {
              onClickLogout();
            },
            // "تسجيل خروح",
            title: Text(
              "23".tr,
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.output,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void onClickLogout() async {
    UserInformation.USER_TOKEN = '';
    EasyLoading.show(status: 'loading... ');
    await controller.logoutOnClick();
    if (controller.logoutStatus) {
      EasyLoading.showSuccess('succsseful log out',
          duration: Duration(seconds: 2));
      Get.offAllNamed('Login');
    } else {
      EasyLoading.showError('erroe',
          duration: Duration(seconds: 5), dismissOnTap: true);
    }
  }
}
