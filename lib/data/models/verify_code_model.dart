class VerifyCodeModel {
  String? message;
  int? status;
  bool? success;

  VerifyCodeModel({this.message, this.status, this.success});

  VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    return data;
  }
}
