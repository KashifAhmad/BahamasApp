import 'dart:convert';
import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/models/get_business_feed_model.dart';
import 'package:bahamas/data/models/get_most_popular_businesses_model.dart';
import 'package:bahamas/data/models/get_reviews_model.dart';
import 'package:bahamas/data/models/get_specific_business_model.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SavedBusinessController extends GetxController {

  RxString reviewsCount = ''.obs;

  // Business profile social variables
  RxString facebook = ''.obs;
  RxString instagram = ''.obs;
  RxString twitter = ''.obs;
  RxString whatsapp = ''.obs;
  RxString websiteUrl = ''.obs;

  // RxList<String> getAllSavedBusinessIdsList = <String>[].obs;


  // Edit socials textfields
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    facebookController.dispose();
    instagramController.dispose();
    twitterController.dispose();
    whatsappController.dispose();
    contactController.dispose();
    websiteUrlController.dispose();
  }


  // Get user detail with saved business list
  // Future<GetSaveBusinessDetailModel> getUserDetailWithBusiness(String userId) async {
  //   try {
  //     debugPrint(Apis.getSaveBusinessApi+userId);
  //     var response = await http.get(Uri.parse(Apis.getSaveBusinessApi+userId));
  //     var data = jsonDecode(response.body.toString());
  //     if (kDebugMode) {
  //       print('######datataaaa#######');
  //       print(response.statusCode.toString());
  //       print(data);
  //       print(response.body.toString());
  //     }
  //     if(data['status'] == 200){
  //       if(data['success']){
  //         return GetSaveBusinessDetailModel.fromJson(data);
  //       }else {
  //         return GetSaveBusinessDetailModel();
  //       }
  //     }else {
  //       return GetSaveBusinessDetailModel();
  //     }
  //   } catch (e) {
  //     // Get.back();
  //     debugPrint(e.toString());
  //   }
  //   return GetSaveBusinessDetailModel();
  // }
  
  // Future<GetSaveBusinessesModel> getUserDetailWithBusiness(String userId) async {
  //   try {
  //     getAllSavedBusinessIdsList.toList().toSet();
  //     debugPrint(Apis.getSaveBusinessApi+userId);
  //     var response = await http.get(Uri.parse(Apis.getSaveBusinessApi+userId));
  //     var data = jsonDecode(response.body.toString());
  //     if (kDebugMode) {
  //       print('######datataaaa#######');
  //       print(response.statusCode.toString());
  //       print(data);
  //       print(response.body.toString());
  //     }
  //     if(response.statusCode == 200){
  //       if(data['success']){
  //         var jsonData = GetSaveBusinessesModel.fromJson(jsonDecode(response.body));
  //         List<String> saveIds = [];
  //         for(int i = 0; i < jsonData.data!.length; i++) {
  //           saveIds.add(jsonData.data![i].business!.sId.toString());
  //         }
  //         getAllSavedBusinessIdsList.value = saveIds.toSet().toList();
  //         debugPrint('Saved Business Response* $getAllSavedBusinessIdsList');
  //         return GetSaveBusinessesModel.fromJson(data);
  //       }else {
  //         return GetSaveBusinessesModel(
  //           message: data['message']
  //         );
  //       }
  //     }else {
  //       return GetSaveBusinessesModel(
  //           message: data['message']
  //       );
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return GetSaveBusinessesModel(
  //           message: 'No Internet Connection'
  //       );
  //     }
  //   }
  //   return GetSaveBusinessesModel();
  // }

  // Get specific Business
   Future<GetSpecificBusinessModel> getSpecificBusiness(String businessId) async {
    try {
      debugPrint(Apis.getSpecificBusinessApi+businessId);
      var response = await http.get(Uri.parse(Apis.getSpecificBusinessApi+businessId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return GetSpecificBusinessModel.fromJson(data);
        }else {
          return GetSpecificBusinessModel(
            message: data['message']
          );
        }
      }else {
        return GetSpecificBusinessModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetSpecificBusinessModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetSpecificBusinessModel();
  }

  // Get business review api
  Future<GetReviewsModel> getBusinessReviewApi(String businessId) async {
    try {
      debugPrint(Apis.getReviewsApi+businessId.toString());
      var response = await http.get(Uri.parse(Apis.getReviewsApi+businessId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(data);
      }
      if(response.statusCode == 200){
        if(data['success']){
          var modelData = GetReviewsModel.fromJson(data);
          reviewsCount.value = modelData.data!.length.toString();
          return GetReviewsModel.fromJson(data);
        }else {
          return GetReviewsModel();
        }
      }else {
        return GetReviewsModel();
      }
    } catch (e) {
      if (e is SocketException) {
        return GetReviewsModel();
      }
    }
    return GetReviewsModel();
  }

  // Future<GetSpecificBusinessModel> getSpecificBusiness(String businessId) async {
  //   try {
  //     debugPrint(Apis.getSpecificBusinessApi+businessId);
  //     var response = await http.get(Uri.parse(Apis.getSpecificBusinessApi+businessId));
  //     var data = jsonDecode(response.body.toString());
  //     if (kDebugMode) {
  //       print('######datataaaa#######');
  //       print(response.statusCode.toString());
  //       print(data);
  //       print(response.body.toString());
  //     }
  //     if(response.statusCode == 200){
  //       if(data['success']){
  //         businessDetail = data;
  //         return GetSpecificBusinessModel.fromJson(data);
  //       }else {
  //         return GetSpecificBusinessModel(
  //           message: data['message']
  //         );
  //       }
  //     }else {
  //       return GetSpecificBusinessModel(
  //           message: data['message']
  //       );
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return GetSpecificBusinessModel(
  //           message: 'No Internet Connection'
  //       );
  //     }
  //   }
  //   return GetSpecificBusinessModel();
  // }

  //##################################### Business Feeds #############################//

  Future<GetBusinessFeedsModel> getAllBusinessFeedApi() async {
    try {
      debugPrint(Apis.getAllBusinessFeedsApi);
      http.Response response= await http.get(Uri.parse(Apis.getAllBusinessFeedsApi));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return GetBusinessFeedsModel.fromJson(data);
        }else {
          return GetBusinessFeedsModel();
        }
      }else {
        return GetBusinessFeedsModel();
      }
    } catch (e) {
      if (e is SocketException) {
        return GetBusinessFeedsModel();
      }
    }
    return GetBusinessFeedsModel();
  }

  // Future<GetBusinessFeedsModel> getAllBusinessFeedApi() async {
  //   try {
  //     await SavedBusinessRepository().getAllBusinessFeedApi().then((value) {
  //     if (kDebugMode) {
  //       print('###### Data #####');
  //       print(value.status.toString());
  //       print('#######Data######: ${value.data}');
  //     }
  //     var data = jsonDecode(value.data.toString());
  //     if(data['status'] == 200){
  //       if(data['success'] == true){
  //         debugPrint('Data Count: ${value.data?.length.toString()}');
  //         return GetBusinessFeedsModel.fromJson(data);
  //       }else {
  //         return GetBusinessFeedsModel();
  //       }
  //     }else {
  //       return GetBusinessFeedsModel();
  //     }
  //     }).onError((error, stackTrace) {
  //       // Get.back();
  //       debugPrint(error.toString());
  //       return GetBusinessFeedsModel();
  //     });
  //   } catch (e) {
  //     // Get.back();
  //     debugPrint(e.toString());
  //   }
  //   return GetBusinessFeedsModel();
  // }


  //##################################### Explore (Most popular businesses) #############################//

   Future<GetMostPopularBusinessesModel> mostPopularBusinessesApi() async {
    try {
      debugPrint(Apis.mostPopularApi);
      var response = await http.get(Uri.parse(Apis.mostPopularApi));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return GetMostPopularBusinessesModel.fromJson(data);
        }else {
          return GetMostPopularBusinessesModel();
        }
      }else {
        return GetMostPopularBusinessesModel();
      }
    } catch (e) {
      if (e is SocketException) {
        return GetMostPopularBusinessesModel();
      }
    }
    return GetMostPopularBusinessesModel();
  }


//##################################### Edit business profile #############################//

  // Edit profile api
  Future editBusinessSocials(String businessId, Map data) async {
    Constant.showDialog();
    dynamic response;
    response = await NetworkApiService().putApiResponse(Apis.updateBusinessProfileApi, businessId, data);

    debugPrint(response.toString());
    Get.back();
    if (response['success'] == true) {
      facebook.value = response['data']['social']['facebook'].toString();
      debugPrint(facebook.value.toString());
      instagram.value = response['data']['social']['instagram'].toString();
      debugPrint(instagram.value.toString());
      twitter.value = response['data']['social']['twitter'].toString();
      debugPrint(twitter.value.toString());
      whatsapp.value = response['data']['social']['whatsapp'].toString();
      debugPrint(whatsapp.value.toString());
      websiteUrl.value = response['data']['social']['website'].toString();
      debugPrint(websiteUrl.value.toString());
      SessionController.saveBusinessProfileInPreference(response);
      SessionController.getBusinessProfileFromPreference();
      Get.back();
      Constant.showSnackBar('Successfully', 'Business profile updated successfully');
    } else {
      Constant.showSnackBar('Error', response);
    }
  }
} 