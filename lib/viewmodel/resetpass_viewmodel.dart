import 'package:flutter/material.dart';

import 'package:softlab_project/repositories/resetpass_repo.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final ResetPasswordRepository _repository = ResetPasswordRepository();

  Future<Map<String, dynamic>> resetPassword(
      String token, String password, String cpassword) async {
    try {
      final response =
          await _repository.resetPassword(token, password, cpassword);
      print('Password reset: ${response['message']}');
      return response;
    } catch (e) {
      print('Password reset failed: $e');
      return {
        'success': 'false',
        'message': 'An error occurred while resetting password.',
      };
    }
  }
}
