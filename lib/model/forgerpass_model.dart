class ForgotPasswordDataModel {
  final String mobile;

  ForgotPasswordDataModel({required this.mobile});

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
    };
  }
}
