class GetAllSavedBusinessesModel {
  String? message;
  int? status;
  bool? success;
  List<Data>? data;

  GetAllSavedBusinessesModel(
      {this.message, this.status, this.success, this.data});

  GetAllSavedBusinessesModel.fromJson(Map<String, dynamic> json) {
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
  Business? business;
  String? sId;
  String? savedAt;

  Data({this.business, this.sId, this.savedAt});

  Data.fromJson(Map<String, dynamic> json) {
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
    sId = json['_id'];
    savedAt = json['savedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    data['_id'] = this.sId;
    data['savedAt'] = this.savedAt;
    return data;
  }
}

class Business {
  String? sId;
  String? name;
  String? address;
  List<String>? gallery;
  double? avgRating;

  Business({this.sId, this.name, this.address, this.gallery, this.avgRating});

  Business.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    gallery = json['gallery'].cast<String>();
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['gallery'] = this.gallery;
    data['avgRating'] = this.avgRating;
    return data;
  }
}
