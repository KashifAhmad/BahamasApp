class UserModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  UserModel({this.message, this.status, this.success, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userStatus;
  dynamic facebookId;
  String? sId;
  String? fullName;
  String? email;
  String? phone;
  String? image;
  String? bioData;
  dynamic verificationCode;
  bool? locationAccess;
  bool? notification;
  String? profileType;
  bool? deleteAccount;
  bool? activateAccount;
  dynamic recaptcha;
  String? password;
  dynamic googleId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userStatus,
      this.facebookId,
      this.sId,
      this.fullName,
      this.email,
      this.phone,
      this.image,
      this.bioData,
      this.verificationCode,
      this.locationAccess,
      this.notification,
      this.profileType,
      this.deleteAccount,
      this.activateAccount,
      this.recaptcha,
      this.password,
      this.googleId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userStatus = json['userStatus'];
    facebookId = json['facebookId'];
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    bioData = json['bioData'];
    verificationCode = json['verificationCode'];
    locationAccess = json['locationAccess'];
    notification = json['notification'];
    profileType = json['profileType'];
    deleteAccount = json['deleteAccount'];
    activateAccount = json['activateAccount'];
    recaptcha = json['recaptcha'];
    password = json['password'];
    googleId = json['googleId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userStatus'] = userStatus;
    data['facebookId'] = facebookId;
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['bioData'] = bioData;
    data['verificationCode'] = verificationCode;
    data['locationAccess'] = locationAccess;
    data['notification'] = notification;
    data['profileType'] = profileType;
    data['deleteAccount'] = deleteAccount;
    data['activateAccount'] = activateAccount;
    data['recaptcha'] = recaptcha;
    data['password'] = password;
    data['googleId'] = googleId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
