import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';
import 'package:softlab_project/utils/app_url.dart';

class ResetPasswordRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Map<String, dynamic>> resetPassword(
      String token, String password, String cpassword) async {
    try {
      final response = await _apiService.getPostApiResponse(
        AppUrl.resetdpass,
        {"token": token, "password": password, "cpassword": cpassword},
      );
      return response;
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }
}
