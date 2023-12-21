import 'package:get/get.dart';

import '../model/user.dart';
import '../services/signup_services.dart';

class SignupController extends GetxController {
  var email = '';
  var password = '';
  var name = '';
  var phone = '';

  var message;
  var signupStatus = false;

  SignupServices service = SignupServices();

  Future<void> SignupOnClick() async {
    User user =
        User(name: name, email: email, password: password, phone: phone);
    signupStatus = await service.register(user);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    } else if (message is Map) {
      String temp = '';
      if (message['name'] != null) {
        List key = message['name'];
        for (String s in key) temp += s + '\n';
      }
      if (message['email'] != null) {
        List key = message['email'];
        for (String s in key) temp += s + '\n';
      }
      if (message['phoneOne'] != null) {
        List key = message['phoneOne'];
        for (String s in key) temp += s + '\n';
      }
      if (message['password'] != null) {
        List key = message['password'];
        for (String s in key) temp += s + '\n';
      }
      message = temp;
    }
  }
}
