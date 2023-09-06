class EditProfileModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  EditProfileModel({this.message, this.status, this.success, this.data});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? recaptcha;
  String? userStatus;
  String? password;
  dynamic googleId;
  dynamic facebookId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
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
      this.userStatus,
      this.password,
      this.googleId,
      this.facebookId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    userStatus = json['userStatus'];
    password = json['password'];
    googleId = json['googleId'];
    facebookId = json['facebookId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['userStatus'] = userStatus;
    data['password'] = password;
    data['googleId'] = googleId;
    data['facebookId'] = facebookId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
