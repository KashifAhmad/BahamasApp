class GetSaveBusinessesModel {
  String? message;
  int? status;
  bool? success;
  List<GetSaveBusinessDetailData>? data;

  GetSaveBusinessesModel({this.message, this.status, this.success, this.data});

  GetSaveBusinessesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetSaveBusinessDetailData>[];
      json['data'].forEach((v) {
        data!.add(new GetSaveBusinessDetailData.fromJson(v));
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

class GetSaveBusinessDetailData {
  Business? business;
  String? sId;
  String? savedAt;

  GetSaveBusinessDetailData({this.business, this.sId, this.savedAt});

  GetSaveBusinessDetailData.fromJson(Map<String, dynamic> json) {
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
  CategoryId? categoryId;
  String? name;
  String? address;
  List<String>? gallery;
  num? avgRating;

  Business({this.sId, this.name, this.address, this.gallery, this.avgRating});

  Business.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['categoryId'] != null
      ? new CategoryId.fromJson(json['categoryId'])
      : null;
    name = json['name'];
    address = json['address'];
    gallery = json['gallery'].cast<String>();
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
    data['name'] = this.name;
    data['address'] = this.address;
    data['gallery'] = this.gallery;
    data['avgRating'] = this.avgRating;
    return data;
  }
}
class CategoryId {
  String? sId;
  String? category;

  CategoryId({this.sId, this.category});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    return data;
  }
}

