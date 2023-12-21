import 'dart:convert';

import 'package:apothecary/config/server_config.dart';
import 'package:http/http.dart' as http;

import '../config/user_information.dart';
import '../model/user.dart';
import '../native_service/secure_storage.dart';

class SignupServices {
  var message;
  var token;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.signup);
  Future<bool> register(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'phoneOne': user.phone,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['message'] != null) {
        message = jsonResponse['message'];

        token = jsonResponse['token'];
        UserInformation.USER_TOKEN = token;
        SecureStorage storage = SecureStorage();
        storage.save('token', UserInformation.USER_TOKEN);

        return true;
      } else if (jsonResponse['errors'] != null) {
        message = jsonResponse['errors'];
        return false;
      } else {
        return false;
      }
    } else if (response.statusCode == 500) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else {
      return false;
    }
  }
}
