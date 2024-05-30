import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';
import 'package:softlab_project/model/verify_model.dart';
import 'package:softlab_project/utils/app_url.dart';
import 'package:softlab_project/utils/utils.dart';

import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';
import 'package:softlab_project/utils/app_url.dart';

class VerifyOtpRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Map<String, dynamic>> verifyOtp(String otp) async {
    try {
      final response = await _apiService.getPostApiResponse(
        AppUrl.verifyOtp,
        {"otp": otp},
      );
      return response;
    } catch (e) {
      throw Exception('OTP verification failed: $e');
    }
  }
}
