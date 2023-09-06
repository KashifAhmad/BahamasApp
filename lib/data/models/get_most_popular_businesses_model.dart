class GetMostPopularBusinessesModel {
  String? message;
  int? status;
  bool? success;
  List<GetMostpopularBusinessesData>? data;

  GetMostPopularBusinessesModel(
      {this.message, this.status, this.success, this.data});

  GetMostPopularBusinessesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetMostpopularBusinessesData>[];
      json['data'].forEach((v) {
        data!.add(new GetMostpopularBusinessesData.fromJson(v));
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

class GetMostpopularBusinessesData {
  String? sId;
  String? userId;
  String? islandId;
  CategoryId? categoryId;
  String? subCategoryId;
  String? name;
  String? address;
  String? contact;
  Location? location;
  String? aboutBusiness;
  List<String>? gallery;
  Social? social;
  String? date;
  int? iV;
  num? averageRating;
  Analytics? analytics;
  num? total;

  GetMostpopularBusinessesData(
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
      this.date,
      this.iV,
      this.averageRating,
      this.analytics,
      this.total});

  GetMostpopularBusinessesData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    islandId = json['islandId'];
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
    date = json['date'];
    iV = json['__v'];
    averageRating = json['averageRating'];
    analytics = json['analytics'] != null
        ? new Analytics.fromJson(json['analytics'])
        : null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['islandId'] = this.islandId;
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
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['averageRating'] = this.averageRating;
    if (this.analytics != null) {
      data['analytics'] = this.analytics!.toJson();
    }
    data['total'] = this.total;
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

class Analytics {
  int? searches;
  int? saves;
  int? views;

  Analytics({this.searches, this.saves, this.views});

  Analytics.fromJson(Map<String, dynamic> json) {
    searches = json['searches'];
    saves = json['saves'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searches'] = this.searches;
    data['saves'] = this.saves;
    data['views'] = this.views;
    return data;
  }
}
