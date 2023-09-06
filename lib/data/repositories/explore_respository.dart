import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:flutter/foundation.dart';

class ExploreRepository {

  // View business
  Future<dynamic> viewBusiness(var data) async {
    try {
      debugPrint(Apis.addViewBusinessApi);
      var response = await NetworkApiService().getPostApiResponse(Apis.addViewBusinessApi, data);
      debugPrint("View Business Response: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}