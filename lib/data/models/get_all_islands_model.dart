class GetAllIslandsModel {
  String? message;
  int? status;
  bool? success;
  List<IslandsData>? data;

  GetAllIslandsModel({this.message, this.status, this.success, this.data});

  GetAllIslandsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <IslandsData>[];
      json['data'].forEach((v) {
        data!.add(new IslandsData.fromJson(v));
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

class IslandsData {
  String? sId;
  String? island;
  int? totalBusinesses;

  IslandsData({this.sId, this.island, this.totalBusinesses});

  IslandsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    island = json['island'];
    totalBusinesses = json['totalBusinesses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['island'] = this.island;
    data['totalBusinesses'] = this.totalBusinesses;
    return data;
  }
}
