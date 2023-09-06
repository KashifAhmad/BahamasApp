class BusinessProfileModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  BusinessProfileModel({this.message, this.status, this.success, this.data});

  BusinessProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? islandId;
  String? categoryId;
  String? subCategoryId;
  String? name;
  String? address;
  String? contact;
  Location? location;
  String? aboutBusiness;
  List<String>? gallery;
  Social? social;
  num? totalSaves;
  String? sId;
  String? date;
  int? iV;

  Data(
      {this.userId,
      this.islandId,
      this.categoryId,
      this.subCategoryId,
      this.name,
      this.address,
      this.contact,
      this.location,
      this.aboutBusiness,
      this.gallery,
      this.social,
      this.totalSaves,
      this.sId,
      this.date,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    islandId = json['islandId'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    aboutBusiness = json['aboutBusiness'];
    gallery = json['gallery'].cast<String>();
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
    totalSaves = json['totalSaves'];
    sId = json['_id'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['islandId'] = this.islandId;
    data['categoryId'] = this.categoryId;
    data['subCategoryId'] = this.subCategoryId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['aboutBusiness'] = this.aboutBusiness;
    data['gallery'] = this.gallery;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    data['totalSaves'] = this.totalSaves;
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Social {
  String? facebook;
  String? instagram;
  String? twitter;
  String? whatsapp;
  String? website;
  String? sId;

  Social(
      {this.facebook,
      this.instagram,
      this.twitter,
      this.whatsapp,
      this.website,
      this.sId});

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    whatsapp = json['whatsapp'];
    website = json['website'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['whatsapp'] = this.whatsapp;
    data['website'] = this.website;
    data['_id'] = this.sId;
    return data;
  }
}
