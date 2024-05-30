class LoginDataModel {
  final String email;
  final String password;
  final String role;
  final String deviceToken;
  final String type;
  final String socialId;

  LoginDataModel({
    required this.email,
    required this.password,
    required this.role,
    required this.deviceToken,
    required this.type,
    required this.socialId,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
      'device_token': deviceToken,
      'type': type,
      'social_id': socialId,
    };
  }
}
