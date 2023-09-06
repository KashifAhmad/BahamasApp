class GetReviewsModel {
  String? _message;
  int? _status;
  bool? _success;
  List<Data>? _data;

  GetReviewsModel(
      {String? message, int? status, bool? success, List<Data>? data}) {
    if (message != null) {
      this._message = message;
    }
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  int? get status => _status;
  set status(int? status) => _status = status;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  GetReviewsModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['status'] = this._status;
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _sId;
  UserId? _userId;
  BusinessId? _businessId;
  int? _ratingStars;
  String? _comments;
  String? _date;
  int? _iV;

  Data(
      {String? sId,
      UserId? userId,
      BusinessId? businessId,
      int? ratingStars,
      String? comments,
      String? date,
      int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (businessId != null) {
      this._businessId = businessId;
    }
    if (ratingStars != null) {
      this._ratingStars = ratingStars;
    }
    if (comments != null) {
      this._comments = comments;
    }
    if (date != null) {
      this._date = date;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  UserId? get userId => _userId;
  set userId(UserId? userId) => _userId = userId;
  BusinessId? get businessId => _businessId;
  set businessId(BusinessId? businessId) => _businessId = businessId;
  int? get ratingStars => _ratingStars;
  set ratingStars(int? ratingStars) => _ratingStars = ratingStars;
  String? get comments => _comments;
  set comments(String? comments) => _comments = comments;
  String? get date => _date;
  set date(String? date) => _date = date;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    _businessId = json['businessId'] != null
        ? new BusinessId.fromJson(json['businessId'])
        : null;
    _ratingStars = json['ratingStars'];
    _comments = json['comments'];
    _date = json['date'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    if (this._userId != null) {
      data['userId'] = this._userId!.toJson();
    }
    if (this._businessId != null) {
      data['businessId'] = this._businessId!.toJson();
    }
    data['ratingStars'] = this._ratingStars;
    data['comments'] = this._comments;
    data['date'] = this._date;
    data['__v'] = this._iV;
    return data;
  }
}

class UserId {
  String? _sId;
  String? _fullName;
  String? _image;

  UserId({String? sId, String? fullName, String? image}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (image != null) {
      this._image = image;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get image => _image;
  set image(String? image) => _image = image;

  UserId.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _fullName = json['fullName'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['fullName'] = this._fullName;
    data['image'] = this._image;
    return data;
  }
}

class BusinessId {
  String? _sId;
  String? _name;

  BusinessId({String? sId, String? name}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;

  BusinessId.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['name'] = this._name;
    return data;
  }
}
