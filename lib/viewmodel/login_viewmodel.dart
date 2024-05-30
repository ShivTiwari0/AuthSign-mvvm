import 'package:flutter/material.dart';

import 'package:softlab_project/model/login_model.dart';
import 'package:softlab_project/repositories/login_repo.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  Future<Map<String, dynamic>> login(String email, String password, String role,
      String deviceToken, String type, String socialId) async {
    final loginData = LoginDataModel(
      email: email,
      password: password,
      role: role,
      deviceToken: deviceToken,
      type: type,
      socialId: socialId,
    );

    try {
      final response = await _repository.login(loginData);
      print('Login successful: $response');
      return response;
    } catch (e) {
      print('Login failed: $e');
      return {'success': 'false', 'message': 'An error occurred during login.'};
    }
  }
}
