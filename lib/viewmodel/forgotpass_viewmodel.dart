import 'package:flutter/material.dart';

import 'package:softlab_project/model/forgerpass_model.dart';

import 'package:softlab_project/repositories/forgotpass_repo.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final ForgotPasswordRepository _repository = ForgotPasswordRepository();

  Future<Map<String, dynamic>> sendOtp(String mobile) async {
    final forgotPasswordData = ForgotPasswordDataModel(mobile: mobile);

    try {
      final response = await _repository.sendOtp(forgotPasswordData);
      print('OTP sent: $response');
      return response;
    } catch (e) {
      print('Forgot Password failed: $e');
      return {
        'success': 'false',
        'message': 'An error occurred while sending OTP.'
      };
    }
  }
}
