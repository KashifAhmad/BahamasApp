class GetAllCategoryModel {
  String? message;
  int? status;
  bool? success;
  List<CatagoryDetailData>? data;

  GetAllCategoryModel({this.message, this.status, this.success, this.data});

  GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <CatagoryDetailData>[];
      json['data'].forEach((v) {
        data!.add(new CatagoryDetailData.fromJson(v));
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

class CatagoryDetailData {
  String? sId;
  String? category;
  List<SubCategory>? subCategory;
  int? iV;
  String? icon;

  CatagoryDetailData({this.sId, this.category, this.subCategory, this.iV, this.icon});

  CatagoryDetailData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
    iV = json['__v'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['icon'] = this.icon;
    return data;
  }
}

class SubCategory {
  String? subCategory;
  String? sId;

  SubCategory({this.subCategory, this.sId});

  SubCategory.fromJson(Map<String, dynamic> json) {
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
