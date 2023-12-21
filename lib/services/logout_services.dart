import 'dart:convert';
import 'package:apothecary/config/server_config.dart';
import 'package:http/http.dart' as http;

import '../config/user_information.dart';

class LogoutServices {
  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);

  Future<bool> logout(String token) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token ',
    });
    UserInformation.USER_TOKEN = '';
    print(response.statusCode);
    print(response.body);
    print(token);

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      message = 'successfull';
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
