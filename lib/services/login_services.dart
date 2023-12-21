import 'dart:convert';

import 'package:apothecary/config/server_config.dart';
import 'package:apothecary/config/user_information.dart';
import 'package:apothecary/native_service/secure_storage.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class LoginServices {
  var message;
  var token;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> login(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'email': user.email,
      'password': user.password,
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      message = 'successfull';
      token = jsonResponse['token'];
      UserInformation.USER_TOKEN = token;
      SecureStorage storage = SecureStorage();
      storage.save('token', UserInformation.USER_TOKEN);

      return true;
    } else if (response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else {
      return false;
    }
  }
}
