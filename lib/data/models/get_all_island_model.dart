class GetAllIslandModel {
  String? message;
  int? status;
  bool? success;
  List<Data>? data;

  GetAllIslandModel({this.message, this.status, this.success, this.data});

  GetAllIslandModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? sId;
  String? island;

  Data({this.sId, this.island});

  Data.fromJson(Map<String, dynamic> json) {
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
