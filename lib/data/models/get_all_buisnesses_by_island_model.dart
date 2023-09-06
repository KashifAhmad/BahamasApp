class GetAllBusinessesByIslandsModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  GetAllBusinessesByIslandsModel(
      {this.message, this.status, this.success, this.data});

  GetAllBusinessesByIslandsModel.fromJson(Map<String, dynamic> json) {
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
  List<BusinessesByIslandData>? businesses;
  int? totalNumberOfBusinesses;

  Data({this.businesses, this.totalNumberOfBusinesses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <BusinessesByIslandData>[];
      json['businesses'].forEach((v) {
        businesses!.add(new BusinessesByIslandData.fromJson(v));
      });
    }
    totalNumberOfBusinesses = json['totalNumberOfBusinesses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businesses != null) {
      data['businesses'] = this.businesses!.map((v) => v.toJson()).toList();
    }
    data['totalNumberOfBusinesses'] = this.totalNumberOfBusinesses;
    return data;
  }
}

class BusinessesByIslandData {
  String? sId;
  UserId? userId;
  IslandId? islandId;
  CategoryId? categoryId;
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

  BusinessesByIslandData(
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
      this.iV});

  BusinessesByIslandData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    islandId = json['islandId'] != null
        ? new IslandId.fromJson(json['islandId'])
        : null;
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.islandId != null) {
      data['islandId'] = this.islandId!.toJson();
    }
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
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
    return data;
  }
}

class UserId {
  String? sId;
  String? fullName;
  String? email;

  UserId({this.sId, this.fullName, this.email});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}

class IslandId {
  String? sId;
  String? island;

  IslandId({this.sId, this.island});

  IslandId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    island = json['island'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['island'] = this.island;
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
