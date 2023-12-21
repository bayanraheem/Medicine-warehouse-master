import 'package:apothecary/native_service/secure_storage.dart';
import 'package:apothecary/services/login_services.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class LoginController extends GetxController {
  late String email;
  var password;
  var loginStatus;
  var message;

  late LoginServices service;

  @override
  void onInit() {
    email = '';
    password = '';
    loginStatus = false;
    message = '';
    service = LoginServices();

    super.onInit();
  }

  Future<void> loginOnClick() async {
    User user = User(email: email, password: password);
    loginStatus = await service.login(user);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }
}
