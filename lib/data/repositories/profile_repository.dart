import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/foundation.dart';

class ProfileRepository {

  //   Future<dynamic> updateUserProfileWithImageAndNoImage(
  //     File? image,
  //     String title,
  //     String description,
  //     String preparedOn,
  //     String servings,
  //     String allergens,
  //     String ingredients,
  //     String userID,
  //     String communities,
  //     String address,
  //     String exchangeFor,
  //     bool isEdited,
  //     String postId ,
  //     ) async {
  //   if (kDebugMode) {
  //     print('start');
  //     print(title);
  //     print(description);
  //     print(preparedOn);
  //     print(servings);
  //     print(allergens.replaceAll(' ', ''));
  //     print(ingredients);
  //     print(userID);
  //     print(communities.replaceAll(' ', ''));
  //     print(address);
  //     print(exchangeFor);
  //     print('image$image');
  //   }
  //   try {
  //     var uri = Uri.parse(Apis.editProfileApi);
  //     var request = MultipartRequest('POST', uri);
  //     request.fields['title'] = title.trim();
  //     request.fields['description'] = description.trim();
  //     request.fields['prepared_on'] = preparedOn.trim();
  //     request.fields['servings'] = servings.trim();
  //     request.fields['allergens'] = allergens.replaceAll(' ', '');
  //     request.fields['ingredients'] = ingredients.trim();
  //     request.fields['userid'] = userID.trim();
  //     request.fields['communities'] = communities.replaceAll(' ', '');
  //     request.fields['address'] = address.trim();
  //     request.fields['exchange_for'] = exchangeFor.trim();
  //     request.fields['postid'] = postId.trim();
  //     if(image.toString() != 'null'){
  //       var stream = http.ByteStream(image!.openRead());
  //       stream.cast() ;
  //       request.files.add(http.MultipartFile.fromBytes("image", image.readAsBytesSync(), filename: "test.${image.path.split(".").last}", contentType: MediaType("image", image.path.split(".").last),),);
  //     }
  //     var response = await request.send();
  //     final responseBody = await response.stream.bytesToString();
  //     if (kDebugMode) {
  //       print('RESPONSE BODY: ${response.statusCode}');
  //       print('RESPONSE BODY:   $responseBody');
  //     }
  //     if (kDebugMode) {
  //       print(response);
  //     }
  //     if (response.statusCode == 200) {
  //     } else {
  //       if (kDebugMode) {
  //         print('failed');
  //         print(response.statusCode);
  //       }
  //     }
  //   }catch(e){
  //     if (kDebugMode) {
  //       print('exception');
  //       print(e.toString());
  //     }
  //   }
  // }

  // Get user reviews
  Future<dynamic> getReviews(String userId) async {
    try {
      debugPrint('${Apis.getUserReviewApi}$userId');
      var response = await NetworkApiService()
          .getGetApiResponse('${Apis.getUserReviewApi}$userId');
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Edit profile
  Future<dynamic> editProfileRepo(dynamic data, String userId) async {
    try {
      debugPrint(Apis.editProfileApi + userId);
      var response = await NetworkApiService()
          .putApiResponse(Apis.editProfileApi, userId, data);
      if (response['success'] == true) {
        await SessionController.saveUserInPreference(response);
        await SessionController.getUserFromPreference();
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Change Password
  Future<dynamic> changePasswordRepo(var data) async {
    try {
      debugPrint(Apis.changePasswordApi);
      var response = await NetworkApiService().getPostApiResponse(
          Apis.changePasswordApi, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

}
