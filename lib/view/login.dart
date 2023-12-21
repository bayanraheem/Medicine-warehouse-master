import 'package:apothecary/controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../locale/locale_controller.dart';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

MyLocaleController controller = Get.find();
LoginController loginController =
    Get.put<LoginController>(LoginController(), permanent: true);

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/image/photo1700768808-removebg-preview.png",
                height: 200),
            const SizedBox(
              height: 10,
            ),
            Text(
              "0".tr,
              style: const TextStyle(
                color: Color.fromARGB(255, 51, 80, 94),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //email
              child: TextField(
                onChanged: (value) {
                  loginController.email = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "1".tr,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: Color(0XFF0F7986)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 50, 157, 211), width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 51, 80, 94), width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //password
              child: TextField(
                onChanged: (value) {
                  loginController.password = value;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                ],
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0XFF0F7986)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 50, 157, 211), width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 51, 80, 94),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "2".tr,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              minWidth: 200,
              onPressed: () {
                onClickLogin();
              },
              color: const Color(0XFF21CFC3),
              child: Text("3".tr,
                  style: const TextStyle(color: Color(0XFF0F7986))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115, vertical: 15),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Text(
                      "4".tr,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    //to signup
                    InkWell(
                      onTap: () {
                        Get.toNamed("signup");
                      },
                      child: Text(
                        "5".tr,
                        style: const TextStyle(
                          color: Color(0XFF0F7986),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //to change language
            InkWell(
              onTap: () {
                if (sharedpref.getString("lang") == "en") {
                  controller.changeLang("ar");
                } else {
                  controller.changeLang("en");
                }
              },
              child: Text(
                "8".tr,
                style: const TextStyle(
                  color: Color(0XFF0F7986),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              decoration: const BoxDecoration(shape: BoxShape.rectangle),
              child: Image.asset('assets/image/img4.png'),
            ),
          ],
        ),
      ),
    );
  }

  void onClickLogin() async {
    EasyLoading.show(status: 'loading... ');
    await loginController.loginOnClick();
    if (loginController.loginStatus) {
      EasyLoading.showSuccess(loginController.message,
          duration: Duration(seconds: 2));
      Get.offAllNamed('TapBar');
    } else {
      EasyLoading.showError(loginController.message,
          duration: Duration(seconds: 5), dismissOnTap: true);
    }
  }
}
