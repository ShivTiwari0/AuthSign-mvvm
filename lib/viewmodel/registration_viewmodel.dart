import 'package:flutter/material.dart';
import 'package:softlab_project/model/registration_model.dart';
import 'package:softlab_project/repositories/registration_repo.dart';

class RegistrationViewModel extends ChangeNotifier {
  final RegistrationRepository _repository = RegistrationRepository();
  final RegistrationData _registrationData = RegistrationData(
    fullName: '',
    email: '',
    phone: '',
    password: '',
    role: 'farmer',
    businessName: '',
    informalName: '',
    address: '',
    city: '',
    state: '',
    zipCode: 0,
    registrationProof: '',
    businessHours: {},
    deviceToken: '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx',
    type: 'email',
    socialId: '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx',
  );

  RegistrationData get registrationData => _registrationData;
  String? _message;

  String? get message => _message;

  void updateFullName(String fullName) {
    _registrationData.fullName = fullName;
    notifyListeners();
  }

  void updateEmail(String email) {
    _registrationData.email = email;
    notifyListeners();
  }

  void updatePhone(String phone) {
    _registrationData.phone = phone;
    notifyListeners();
  }

  void updatePassword(String password) {
    _registrationData.password = password;
    notifyListeners();
  }

  void updateBusinessName(String businessName) {
    _registrationData.businessName = businessName;
    notifyListeners();
  }

  void updateInformalName(String informalName) {
    _registrationData.informalName = informalName;
    notifyListeners();
  }

  void updateAddress(String address) {
    _registrationData.address = address;
    notifyListeners();
  }

  void updateCity(String city) {
    _registrationData.city = city;
    notifyListeners();
  }

  void updateState(String state) {
    _registrationData.state = state;
    notifyListeners();
  }

  void updateZipCode(int zipCode) {
    _registrationData.zipCode = zipCode;
    notifyListeners();
  }

  void updateRegistrationProof(String registrationProof) {
    _registrationData.registrationProof = registrationProof;
    notifyListeners();
  }

  void updateBusinessHours(Map<String, List<String>> businessHours) {
    _registrationData.businessHours = businessHours;
    notifyListeners();
  }

  Future<void> submitRegistration() async {
    try {
      print('viewmodel1');
      final response = await _repository.register(_registrationData);
      print('viewmodel2');
      if (response['success'] == 'true') {
        _message = 'Registration successful: ${response['message']}';
      } else {
        _message = response['message'];
      }
    } catch (e) {
      _message = 'An error occurred: $e';
    }
    notifyListeners();
  }
}
