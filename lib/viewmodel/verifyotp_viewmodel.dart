import 'package:flutter/material.dart';

import 'package:softlab_project/repositories/verify_repo.dart';

class VerifyOtpViewModel extends ChangeNotifier {
  final VerifyOtpRepository _repository = VerifyOtpRepository();

  Future<Map<String, dynamic>> verifyOtp(String otp) async {
    try {
      final response = await _repository.verifyOtp(otp);
      print('OTP verification: ${response['message']}');
      return response;
    } catch (e) {
      print('OTP verification failed: $e');
      return {
        'success': 'false',
        'message': 'An error occurred while verifying OTP.',
      };
    }
  }
}
