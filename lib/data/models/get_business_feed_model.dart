class GetBusinessFeedsModel {
  String? message;
  int? status;
  bool? success;
  List<GetBusinessFeedsData>? data;

  GetBusinessFeedsModel({this.message, this.status, this.success, this.data});

  GetBusinessFeedsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetBusinessFeedsData>[];
      json['data'].forEach((v) {
        data!.add(new GetBusinessFeedsData.fromJson(v));
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

class GetBusinessFeedsData {
  String? sId;
  BusinessId? businessId;
  UserId? userId;
  List<String>? images;
  String? caption;
  String? discovery;
  String? date;
  int? iV;

  GetBusinessFeedsData(
      {this.sId,
      this.businessId,
      this.userId,
      this.images,
      this.caption,
      this.discovery,
      this.date,
      this.iV});

  GetBusinessFeedsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessId = json['businessId'] != null
        ? new BusinessId.fromJson(json['businessId'])
        : null;
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    images = json['images'].cast<String>();
    caption = json['caption'];
    discovery = json['discovery'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.businessId != null) {
      data['businessId'] = this.businessId!.toJson();
    }
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['images'] = this.images;
    data['caption'] = this.caption;
    data['discovery'] = this.discovery;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class BusinessId {
  String? sId;
  IslandId? islandId;
  CategoryId? categoryId;
  String? name;
  String? address;
  Location? location;
  String? aboutBusiness;
  num? averageRating;

  BusinessId(
      {this.sId,
      this.islandId,
      this.categoryId,
      this.name,
      this.address,
      this.location,
      this.aboutBusiness,
      this.averageRating});

  BusinessId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    islandId = json['islandId'] != null
        ? new IslandId.fromJson(json['islandId'])
        : null;
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
    name = json['name'];
    address = json['address'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    aboutBusiness = json['aboutBusiness'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.islandId != null) {
      data['islandId'] = this.islandId!.toJson();
    }
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
    data['name'] = this.name;
    data['address'] = this.address;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['aboutBusiness'] = this.aboutBusiness;
    data['averageRating'] = this.averageRating;
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

class UserId {
  String? sId;
  String? fullName;
  String? image;
  String? bioData;

  UserId({this.sId, this.fullName, this.image, this.bioData});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    image = json['image'];
    bioData = json['bioData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['image'] = this.image;
    data['bioData'] = this.bioData;
    return data;
  }
}
