import 'dart:convert';
import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/models/get_all_buisnesses_by_island_model.dart';
import 'package:bahamas/data/models/get_all_businesses_by_category_model.dart';
import 'package:bahamas/data/models/get_all_categories_model.dart';
import 'package:bahamas/data/models/get_all_islands_model.dart';
import 'package:bahamas/data/models/get_business_by_user_model.dart';
import 'package:bahamas/data/models/get_search_business_model.dart';
import 'package:bahamas/data/models/get_user_detail_model.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/repositories/explore_respository.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ExploreController extends GetxController {

  RxList<String> allSavedBusinessIdsList = <String>[].obs;
  RxList<String> getAllSavedBusinessIdsList = <String>[].obs;

  RxString businessesCountOnIsland = ''.obs;
  RxString islandsCount = '0'.obs;
  RxString categoryBusinessCount = '0'.obs;

  // Get search businesses
  Future<SearchBusinessModel> getSearchBusinesses(String keyWord) async {
    try {
      debugPrint(Apis.searchBusinessApi+keyWord);
      var response = await http.get(Uri.parse(Apis.searchBusinessApi+keyWord));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        // print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return SearchBusinessModel.fromJson(data);
        }else {
          return SearchBusinessModel(data: []);
        }
      }else {
        return SearchBusinessModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return SearchBusinessModel(
            message: 'No Internet Connection'
        );
      }
    }
    return SearchBusinessModel();
  }


  // Get all islands
  Future<GetAllIslandsModel> getAllIslands() async {
    try {
      islandsCount.value = '0';
      debugPrint(Apis.getAllIslandsApi);
      var response = await http.get(Uri.parse(Apis.getAllIslandsApi));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          var decodeData = GetAllIslandsModel.fromJson(jsonDecode(response.body));
          islandsCount.value = decodeData.data?.length.toString() ?? '';
          return GetAllIslandsModel.fromJson(data);
        }else {
          return GetAllIslandsModel(
            message: data['message']
          );
        }
      }else {
        return GetAllIslandsModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetAllIslandsModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetAllIslandsModel();
  }

  // Get all businesses by island
  Future<GetAllBusinessesByIslandsModel> getBusinessesByIslands(String islandId) async {
    try {
      businessesCountOnIsland.value = '0';
      debugPrint(Apis.getBusinessByIslandApi+islandId);
      var response = await http.get(Uri.parse(Apis.getBusinessByIslandApi+islandId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          var decodeData =  GetAllBusinessesByIslandsModel.fromJson(jsonDecode(response.body));
          businessesCountOnIsland.value =  decodeData.data!.totalNumberOfBusinesses.toString();
          return GetAllBusinessesByIslandsModel.fromJson(data);
        }else {
          return GetAllBusinessesByIslandsModel(
            message: data['message']
          );
        }
      }else {
        return GetAllBusinessesByIslandsModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetAllBusinessesByIslandsModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetAllBusinessesByIslandsModel();
  }


   Future<GetSaveBusinessesModel> getUserDetailWithBusiness(String userId) async {
    try {
      getAllSavedBusinessIdsList.toList().toSet();
      debugPrint(Apis.getSaveBusinessApi+userId);
      var response = await http.get(Uri.parse(Apis.getSaveBusinessApi+userId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          var jsonData = GetSaveBusinessesModel.fromJson(jsonDecode(response.body));
          List<String> saveIds = [];
          for(int i = 0; i < jsonData.data!.length; i++) {
            saveIds.add(jsonData.data![i].business!.sId.toString());
          }
          getAllSavedBusinessIdsList.value = saveIds.toSet().toList();
          debugPrint('Saved Business Response* $getAllSavedBusinessIdsList');
          return GetSaveBusinessesModel.fromJson(data);
        }else {
          return GetSaveBusinessesModel(
            message: data['message']
          );
        }
      }else {
        return GetSaveBusinessesModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetSaveBusinessesModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetSaveBusinessesModel();
  }


  // Saved business Api
  Future<bool> savedBusinessApi(String businessId, String userId, bool isLiked) async {
    try {
      allSavedBusinessIdsList.toSet().toList();
      var data = {
        "userId": userId.toString(),
        "businessId": businessId.toString(),
      };
      Constant.showDialog();
      var response = await NetworkApiService().getPostApiResponse(Apis.saveBusinessApi, data);
      Get.back();

      if (response['success'] == true) {
        if (isLiked) {
          allSavedBusinessIdsList.add(businessId);
        } else {
          allSavedBusinessIdsList.remove(businessId);
        }
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

   // Unsaved business Api
  Future<bool> unSavedBusinessApi(String businessId, String userId, bool isLiked) async {
    try {
      var data = {
        "userId": userId.toString(),
        "businessId": businessId.toString(),
      };
      allSavedBusinessIdsList.toSet().toList();

      Constant.showDialog();
      var response = await NetworkApiService().getPostApiResponse(Apis.unSaveBusinessApi, data);
      Get.back();

      if (response['success'] == true) {
        if (isLiked == true) {
          allSavedBusinessIdsList.add(businessId);
        } else {
          allSavedBusinessIdsList.remove(businessId);
        }
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

   // Get all saved busineeses (how many businesses saved by user)
  // Future<GetAllSavedBusinessesModel> getSavedBusinesses(String userId) async {
  //   try {
  //     getAllSavedBusinessIdsList.toSet().toList();
  //     debugPrint(Apis.getSavedBusinessesApi+userId);
  //     var response = await http.get(Uri.parse(Apis.getSavedBusinessesApi+userId));
  //     var data = jsonDecode(response.body.toString());
  //     if (kDebugMode) {
  //       print('######datataaaa#######');
  //       print(response.statusCode.toString());
  //       print(data);
  //       print(response.body.toString());
  //     }
  //     if(response.statusCode == 200){
  //       if(data['success']){
  //         var decodeData = GetAllSavedBusinessesModel.fromJson(jsonDecode(response.body));
  //         for(int i = 0 ; i < decodeData.data!.length ; i++) {
  //           getAllSavedBusinessIdsList.add(decodeData.data?[i].business?.sId.toString() ?? '');
  //         }
  //         debugPrint('All Saved business: ${getAllSavedBusinessIdsList.toString()}');
  //         return GetAllSavedBusinessesModel.fromJson(data);
  //       }else {
  //         return GetAllSavedBusinessesModel(
  //           message: data['message']
  //         );
  //       }
  //     }else {
  //       return GetAllSavedBusinessesModel(
  //           message: data['message']
  //       );
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return GetAllSavedBusinessesModel(
  //           message: 'No Internet Connection'
  //       );
  //     }
  //   }
  //   return GetAllSavedBusinessesModel();
  // }

  // Get all categories
  Future<GetAllCategoryModel> getAllCategoriess() async {
    try {
      debugPrint(Apis.getAllCategoriesApi);
      var response = await http.get(Uri.parse(Apis.getAllCategoriesApi));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return GetAllCategoryModel.fromJson(data);
        }else {
          return GetAllCategoryModel(
            message: data['message']
          );
        }
      }else {
        return GetAllCategoryModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetAllCategoryModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetAllCategoryModel();
  }

  // Get all businesses by category
  Future<GetAllBusinessesBycategoryModel> getBusinessesByCategory(String categoryId) async {
    try {
      categoryBusinessCount.value = '0';
      debugPrint(Apis.getBusinessesByCategoryApi+categoryId);
      var response = await http.get(Uri.parse(Apis.getBusinessesByCategoryApi+categoryId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          var decodeData =  GetAllBusinessesBycategoryModel.fromJson(jsonDecode(response.body));
          categoryBusinessCount.value =  decodeData.data!.length.toString();
          return GetAllBusinessesBycategoryModel.fromJson(data);
        }else {
          return GetAllBusinessesBycategoryModel(
            message: data['message']
          );
        }
      }else {
        return GetAllBusinessesBycategoryModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetAllBusinessesBycategoryModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetAllBusinessesBycategoryModel();
  }

  // Get business by user
   Future<GetBusinessByUser> getBusinessByUser(String userId) async {
    try {
      debugPrint(Apis.getBusinessesByCategoryApi+userId);
      var response = await http.get(Uri.parse(Apis.getBusinessByUserApi+userId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('######datataaaa#######');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          debugPrint("After success business Response: $data");
          await SessionController.saveBusinessProfileInPreference(data);
          await SessionController.getBusinessProfileFromPreference();
          debugPrint('check business profile ID: ${SessionController().businessProfile?.data?.sId.toString()}');
          return GetBusinessByUser.fromJson(data);
        }else {
          return GetBusinessByUser(
            message: data['message']
          );
        }
      }else {
        return GetBusinessByUser(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetBusinessByUser(
            message: 'No Internet Connection'
        );
      }
    }
    return GetBusinessByUser();
  }


  // View business
  Future viewBusinessApi(String busineesId) async {
    var data = {
      "businessId": busineesId
    };
    debugPrint('Data: ${data.toString()}');
    await ExploreRepository().viewBusiness(data).then((value) async {
      debugPrint('Viewed Business By User');
    }).onError((error, stackTrace) {
      debugPrint('View Business Error: $error');
    //   Get.back();
    //     Constant.showSnackBar('Error', error.toString());
    });
  }


} 