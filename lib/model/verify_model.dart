class VerifyModel {
  bool? status;
  String? message;
  Data? data;

  VerifyModel({this.status, this.message, this.data});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? profileStatus;
  String? role;
  String? phone;
  String? phoneVerifiedAt;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Data(
      {this.profileStatus,
      this.role,
      this.phone,
      this.phoneVerifiedAt,
      this.accessToken,
      this.tokenType,
      this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    profileStatus = json['profile_status'];
    role = json['role'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_status'] = this.profileStatus;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
