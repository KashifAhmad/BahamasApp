
import 'dart:io';

import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/models/get_all_categories_model.dart';
import 'package:bahamas/data/models/get_all_island_model.dart';
import 'package:bahamas/data/models/get_sub_category_model.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/material.dart';

class BusinessProfileRepository {

  // Get all categories
  Future<GetAllCategoryModel> getAllCategoriesApi() async{
    try{
      dynamic response = await NetworkApiService().getGetApiResponse(Apis.getAllCategoriesApi);
       var res = GetAllCategoryModel.fromJson(response);
      debugPrint(res.toString());
      debugPrint(res.message);
      debugPrint(res.data.toString());
      return res;
    }catch(e) {
      rethrow;
    }
  }

  // Get all sub categories
  Future<GetSubCategoryModel> getSubCategoriesApi(String categoryId) async{
    try{
      debugPrint(Apis.getSubCategoriesApi+categoryId);
      dynamic response = await NetworkApiService().getGetApiResponse(Apis.getSubCategoriesApi+categoryId);
      var res = GetSubCategoryModel.fromJson(response);
      debugPrint(res.toString());
      debugPrint(res.message);
      debugPrint(res.data.toString());
      return res;
    }catch(e) {
      rethrow;
    }
  }

  // Get all categories
  Future<GetAllIslandModel> getAllIslandsApi() async{
    try{
      debugPrint(Apis.getAllIslandsApi);
      dynamic response = await NetworkApiService().getGetApiResponse(Apis.getAllIslandsApi);
      var res = GetAllIslandModel.fromJson(response);
      debugPrint(res.toString());
      debugPrint(res.message);
      debugPrint(res.data.toString());
      return res;
    }catch(e) {
      rethrow;
    }
  }

  // Update gallery 
  Future<dynamic> updateGalleryImage(String businessId, List<File> galleryPhotosList, dynamic data) async {
    try {
      var response = await NetworkApiService().putMultipleMultipart(
          Apis.updateBusinessProfileApi+businessId, galleryPhotosList, data);
      if (response['success'] == true) {
        await SessionController.saveBusinessProfileInPreference(response);
        await SessionController.getBusinessProfileFromPreference();
        debugPrint("Data Saved");
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
