class SearchBusinessModel {
  String? message;
  int? status;
  bool? success;
  List<SearchBusinessByNameData>? data;

  SearchBusinessModel({this.message, this.status, this.success, this.data});

  SearchBusinessModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <SearchBusinessByNameData>[];
      json['data'].forEach((v) {
        data!.add(new SearchBusinessByNameData.fromJson(v));
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

class SearchBusinessByNameData {
  String? sId;
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
  int? totalSaves;
  String? date;
  int? iV;
  num? avgRating;

  SearchBusinessByNameData(
      {this.sId,
      this.userId,
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
      this.date,
      this.iV,
      this.avgRating});

  SearchBusinessByNameData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    date = json['date'];
    iV = json['__v'];
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['avgRating'] = this.avgRating;
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
