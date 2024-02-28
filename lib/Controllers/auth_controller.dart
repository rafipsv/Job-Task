import 'package:flutter/material.dart';
import 'package:job_task/Models/user_model.dart';
import 'package:job_task/Services/login_service.dart';

class AuthController with ChangeNotifier {
  String userPhone = "0187832241";
  String passWord = "123456";
  LoginService loginService = LoginService();
  UserModel user = UserModel();
  Future<void> getLogin() async {
    user = await loginService.userLogin(
      password: passWord,
      phone: userPhone,
    );
    notifyListeners();
  }
}
