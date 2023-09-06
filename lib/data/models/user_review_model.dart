class GetUserReviewModel {
  GetUserReviewModel({
     this.message,
     this.status,
     this.success,
     this.data,
  });
   String? message;
   int? status;
   bool? success;
   List<Data>? data;
  
  GetUserReviewModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['success'] = success;
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.businessId,
    required this.ratingStars,
    required this.comments,
    required this.date,
    required this.V,
  });
  late final String id;
  late final UserId userId;
  late final BusinessId businessId;
  late final int ratingStars;
  late final String comments;
  late final String date;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = UserId.fromJson(json['userId']);
    businessId = BusinessId.fromJson(json['businessId']);
    ratingStars = json['ratingStars'];
    comments = json['comments'];
    date = json['date'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId.toJson();
    _data['businessId'] = businessId.toJson();
    _data['ratingStars'] = ratingStars;
    _data['comments'] = comments;
    _data['date'] = date;
    _data['__v'] = V;
    return _data;
  }
}

class UserId {
  UserId({
    required this.id,
    required this.fullName,
    required this.image,
  });
  late final String id;
  late final String fullName;
  late final String image;
  
  UserId.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    fullName = json['fullName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['fullName'] = fullName;
    _data['image'] = image;
    return _data;
  }
}

class BusinessId {
  BusinessId({
    required this.id,
    required this.name,
    required this.address,
    required this.aboutBusiness,
  });
  late final String id;
  late final String name;
  late final String address;
  late final String aboutBusiness;
  
  BusinessId.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    address = json['address'];
    aboutBusiness = json['aboutBusiness'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['aboutBusiness'] = aboutBusiness;
    return _data;
  }
}