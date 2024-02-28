// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job_task/Models/user_model.dart';
import 'package:job_task/Utils/network_utils.dart';

class LoginService {
  String baseUrl = NetworkUtils.baseUrl;
  Future<UserModel> userLogin({
    required String password,
    required String phone,
  }) async {
    var response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: ({
        'username': phone,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    } else {
      UserModel userModel = UserModel();
      return userModel;
    }
  }
}
