import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/utils/constants.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  Future<Map> login(String email, String password) async {
    try {
      print(getUrl(['auth', 'login']));
      var response = await http.post(getUrl(['auth', 'login']), body: {
        'email': email,
        'password': password
      }).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        var d = jsonDecode(jsonDecode(response.body));
        return Future.value(d);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return Future.value({});
  }
}
