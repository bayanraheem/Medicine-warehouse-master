import 'package:apothecary/native_service/secure_storage.dart';
import 'package:get/get.dart';

import '../config/user_information.dart';
import '../services/logout_services.dart';

class LogoutController extends GetxController {
  var logoutStatus;
  var message;

  LogoutServices service = LogoutServices();

  SecureStorage _storage = SecureStorage();

  Future<void> checkToken() async {
    _storage.delete('token');
    UserInformation.USER_TOKEN = '';
    String? token = await _storage.read('token');
    if (token == null) {
      Get.offAllNamed('Login');
      logoutStatus = true;
    } else {
      logoutStatus = await service.logout(token);
      message = service.message;

      if (message is List) {
        String temp = '';
        for (String s in message) temp += s + '\n';
        message = temp;
      }
    }
    print('token');
    print(token);
  }

  Future<void> logoutOnClick() async {
    await checkToken();
  }
}
