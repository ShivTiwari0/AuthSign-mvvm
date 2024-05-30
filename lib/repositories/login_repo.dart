import 'package:softlab_project/data/network/base_apiservice.dart';
import 'package:softlab_project/data/network/networkapi_services.dart';
import 'package:softlab_project/model/login_model.dart';
import 'package:softlab_project/app_excaptions.dart';
import 'package:softlab_project/utils/app_url.dart';
import 'package:softlab_project/utils/utils.dart';

class LoginRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Map<String, dynamic>> login(LoginDataModel data) async {
    try {
      final jsonData = data.toJson();
      print('JSON Data: $jsonData');

      final response = await _apiService.getPostApiResponse(
        AppUrl.loginurl,
        jsonData,
      );

      print('Response: $response');
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
