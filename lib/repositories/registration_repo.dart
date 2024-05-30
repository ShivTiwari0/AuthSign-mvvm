import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';

import 'package:softlab_project/model/registration_model.dart';

import 'package:softlab_project/app_excaptions.dart';
import 'package:softlab_project/utils/app_url.dart';
import 'package:softlab_project/utils/utils.dart';

class RegistrationRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Map<String, dynamic>> register(RegistrationData data) async {
    try {
      print('>>>>>${data.toJson()}');
      final response = await _apiService.getPostApiResponse(
        AppUrl.register,
        data.toJson(),
      );

      return response;
    } on FetchDataException catch (e) {
      Utils.toastMessage('Error: $e');
      rethrow;
    } on BadRequestException catch (e) {
      Utils.toastMessage('Error: $e');
      rethrow;
    } on UnaurthorisedException catch (e) {
      Utils.toastMessage('Error: $e');
      rethrow;
    } on TooManyTaps catch (e) {
      Utils.toastMessage('Error: $e');
      rethrow;
    } catch (e) {
      Utils.toastMessage('An unexpected error occurred');
      print(e);
      rethrow;
    }
  }
}
