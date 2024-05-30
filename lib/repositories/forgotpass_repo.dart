import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';
import 'package:softlab_project/model/forgerpass_model.dart';

import 'package:softlab_project/utils/app_url.dart';

class ForgotPasswordRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Map<String, dynamic>> sendOtp(ForgotPasswordDataModel data) async {
    try {
      final response = await _apiService.getPostApiResponse(
        AppUrl.forgotpass,
        data.toJson(),
      );
      return response;
    } catch (e) {
      throw Exception('Forgot Password failed: $e');
    }
  }
}
