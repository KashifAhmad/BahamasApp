class GetSubCategoryModel {
  String? message;
  int? status;
  bool? success;
  List<Data>? data;

  GetSubCategoryModel({this.message, this.status, this.success, this.data});

  GetSubCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? subCategory;
  String? sId;

  Data({this.subCategory, this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    subCategory = json['subCategory'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategory'] = this.subCategory;
    data['_id'] = this.sId;
    return data;
  }
}
