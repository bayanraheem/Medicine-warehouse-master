import 'package:apothecary/controller/SignupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

SignupController controller =
    Get.put<SignupController>(SignupController(), permanent: true);

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 86,
              backgroundColor: Color.fromARGB(255, 14, 99, 93),
              child: CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage('assets/image/img10.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                //enter the name
                child: TextField(
                  onChanged: (Value) {
                    controller.name = Value;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0XFF0F7986)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 50, 157, 211),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 51, 80, 94),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "6".tr,
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (Value) {
                  controller.email = Value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Color(0XFF0F7986)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 50, 157, 211),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 51, 80, 94),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "1".tr,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) {
                  controller.phone = value;
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone, color: Color(0XFF0F7986)),
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
                  hintText: "7".tr,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //password
              child: TextField(
                onChanged: (value) {
                  controller.password = value;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                ],
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Color(0XFF0F7986)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 50, 157, 211),
                      width: 1.5,
                    ),
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
              height: 25,
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              minWidth: 200,
              onPressed: () {
                onClickSignup();
              },
              color: const Color(0XFF21CFC3),
              child: Text("5".tr,
                  style: const TextStyle(color: Color(0XFF0F7986))),
            ),
          ],
        ),
      ),
    );
  }

  void onClickSignup() async {
    //EasyLoading.init();
    EasyLoading.show(status: 'loading... ');
    await controller.SignupOnClick();
    if (controller.signupStatus) {
      EasyLoading.showSuccess(controller.message,
          duration: Duration(seconds: 2));
      Get.offAllNamed('TapBar');
    } else {
      EasyLoading.showError(controller.message,
          duration: Duration(seconds: 5), dismissOnTap: true);
    }
  }
}
