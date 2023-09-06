class GetBusinessByUser {
  String? message;
  int? status;
  bool? success;
  Data? data;

  GetBusinessByUser({this.message, this.status, this.success, this.data});

  GetBusinessByUser.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  UserId? userId;
  IslandId? islandId;
  CategoryId? categoryId;
  List<SubCategory>? subCategory;
  num? averageRating;
  num? reviewCount;
  num? totalRating;
  String? name;
  String? aboutBusiness;
  String? address;
  String? contact;
  Location? location;
  List<String>? gallery;
  Social? social;
  List<Reviews>? reviews;

  Data(
      {this.sId,
      this.userId,
      this.islandId,
      this.categoryId,
      this.subCategory,
      this.averageRating,
      this.reviewCount,
      this.totalRating,
      this.name,
      this.aboutBusiness,
      this.address,
      this.contact,
      this.location,
      this.gallery,
      this.social,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    islandId = json['islandId'] != null
        ? new IslandId.fromJson(json['islandId'])
        : null;
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    reviewCount = json['reviewCount'];
    totalRating = json['totalRating'];
    name = json['name'];
    aboutBusiness = json['aboutBusiness'];
    address = json['address'];
    contact = json['contact'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    gallery = json['gallery'].cast<String>();
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = this.averageRating;
    data['reviewCount'] = this.reviewCount;
    data['totalRating'] = this.totalRating;
    data['name'] = this.name;
    data['aboutBusiness'] = this.aboutBusiness;
    data['address'] = this.address;
    data['contact'] = this.contact;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['gallery'] = this.gallery;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
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

class Reviews {
  String? sId;
  dynamic userId;
  String? businessId;
  num? ratingStars;
  String? comments;
  String? date;
  int? iV;

  Reviews(
      {this.sId,
      this.userId,
      this.businessId,
      this.ratingStars,
      this.comments,
      this.date,
      this.iV});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    businessId = json['businessId'];
    ratingStars = json['ratingStars'];
    comments = json['comments'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['businessId'] = this.businessId;
    data['ratingStars'] = this.ratingStars;
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
