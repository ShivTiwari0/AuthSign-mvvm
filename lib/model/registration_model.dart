class RegistrationData {
  String fullName;
  String email;
  String phone;
  String password;
  String role;
  String businessName;
  String informalName;
  String address;
  String city;
  String state;
  int zipCode;
  String registrationProof;
  Map<String, List<String>> businessHours;
  String deviceToken;
  String type;
  String socialId;

  RegistrationData({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.businessName,
    required this.informalName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationProof,
    required this.businessHours,
    required this.deviceToken,
    required this.type,
    required this.socialId,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
      'business_name': businessName,
      'informal_name': informalName,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode.toString(), // Ensure it's a string
      'registration_proof': registrationProof,
      'business_hours': businessHours,
      'device_token': deviceToken,
      'type': type,
      'social_id': socialId,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
