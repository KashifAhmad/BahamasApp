import 'dart:convert';
import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/models/user_review_model.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/repositories/profile_repository.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/main_authentication/login_account_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {

  // Edit profile Textfields
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // Change password Textfields
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  // Change password screen variables
  RxBool isOldPasswordShow = false.obs;
  RxBool isNewPasswordShow = false.obs;
  RxBool isConfirmPasswordShow = false.obs;
  RxString imageFilePath = "".obs;
  RxString name = "".obs;
  RxString bio = "".obs;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    bioController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  // Edit profile api
  Future editProfile(File? imageFile, String userId, Map data) async {
    Constant.showDialog();
    dynamic response;
    if (imageFile != null) {
      debugPrint('inside if condition');
      response = await NetworkApiService().putImageMultipartWithBody(
        Apis.editProfileApi + userId, imageFile, data);
        debugPrint('response of if condition');
    } else {
      debugPrint('inside else condition');
      response = await NetworkApiService()
        .putApiResponse(
          Apis.editProfileApi,
          userId,
          data
        );
      debugPrint('response of else condition');
    }

    debugPrint(response.toString());
    Get.back();
    if (response['success'] == true) {
      name.value = response['data']['fullName'].toString();
      debugPrint(name.value.toString());
      bio.value = response['data']['bioData'].toString();
      debugPrint(bio.value.toString());
      SessionController.saveUserInPreference(response);
      SessionController.getUserFromPreference();
      Get.back();
      Constant.showSnackBar('Successfully', 'Profile updated successfully');
    } else {
      Constant.showSnackBar('Error', response);
    }
  }

  // Get user reviews
  // Future<GetUserReviewModel> getReviewApi(String userId) async {
  //   try {
  //     await ProfileRepository().getReviews(userId).then((value) {
  //     if (kDebugMode) {
  //       print('###### Data #####');
  //       print(value['status'].toString());
  //       print('#######Data######: ${value['data']}');
  //     }
  //     var data = jsonDecode(value.body.toString());
  //     if(value['status'] == 200){
  //       if(value['success'] == true){
  //         return GetUserReviewModel.fromJson(data);
  //       }else {
  //         return GetUserReviewModel(
  //           message: value['message']
  //         );
  //       }
      // }else {
  //       return GetUserReviewModel(
  //           message: value['message']
  //       );
  //     }
  //     }).onError((error, stackTrace) {
  //       // Get.back();
  //       debugPrint(error.toString());
  //       return GetUserReviewModel();
  //     });
  //   } catch (e) {
  //     // Get.back();
  //     debugPrint(e.toString());
  //   }
  //   return GetUserReviewModel();
  // }

  Future<GetUserReviewModel> getReviewApi(String userId) async {
    try {
      debugPrint(Apis.getUserReviewApi+userId);
      var response = await http.get(Uri.parse(Apis.getUserReviewApi+userId));
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print('mydatataaaa');
        print(response.statusCode.toString());
        print(data);
        print(response.body.toString());
      }
      if(response.statusCode == 200){
        if(data['success']){
          return GetUserReviewModel.fromJson(data);
        }else {
          return GetUserReviewModel(
            message: data['message']
          );
        }
      }else {
        return GetUserReviewModel(
            message: data['message']
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return GetUserReviewModel(
            message: 'No Internet Connection'
        );
      }
    }
    return GetUserReviewModel();
  }


  // Edit profile 
  // Future editProfile(dynamic data, String userId) async {
  //   Constant.showDialog();
  //   await ProfileRepository().editProfileRepo(data, userId).then((value) async {
  //     Get.back();
  //     if (value['success'] == true) {
  //       Get.back();
  //       Get.back();
        // Constant.showSnackBar('Successfully', 'Profile updated successfully');
  //     } else {
  //         Constant.showSnackBar('Error', value['message'].toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     debugPrint('Auth Error: $error');
  //     Get.back();
  //     Constant.showSnackBar('Error', error.toString());
  //   });
  // }

  // Change password
  Future changePassword(dynamic data) async {
    Constant.showDialog();
    await ProfileRepository().changePasswordRepo(data).then((value) async {
      Get.back();
      if (value['success'] == true) {
        Get.back();
        Constant.showSnackBar('Sucessfully', 'Password updated sucessfully');
      } else {
        Constant.showSnackBar('Error', value['message'].toString());
      }
    }).onError((error, stackTrace) {
      debugPrint('Auth Error: $error');
      Get.back();
      if(error.toString() == 'Error During Communication No Internet Connection') {
        Constant.showSnackBar('Error', 'No Internet Connection');
      } else if(error.toString() == 'TimeoutException after 0:00:20.000000: Future not completed'){
        Constant.showSnackBar('Request timeout', 'Please check internet connection.');
      }  else if(error.toString().contains('password and confirm password do not match!')){
          Constant.showSnackBar('Error', 'Password and confirm password do not match!');
      } else if(error.toString().contains('Your new password should not be same to previous password!')){
          Constant.showSnackBar('Error', 'Your new password should not be same to previous password!');
      } else {
        Constant.showSnackBar('Error', error.toString());
      }
    });
  }

  // Delete user account
  Future deleteAccount(String userEmail, BuildContext context) async {
    try {
      Constant.showDialog();
      debugPrint(Apis.deleteAccountApi + userEmail);
      final response = await delete(Uri.parse(Apis.deleteAccountApi + userEmail));
      var data = jsonDecode(response.body.toString());

      if(response.statusCode == 200) {
        Get.back();
        if(data['success'] == true){
          SessionController.removeUserFromPreferences();
          SessionController.removeBusinessPorfileFromPreferences();
          debugPrint(SessionController().user!.data?.email ?? 'Email deleted from prefrence');
          debugPrint(SessionController().user!.data?.fullName ?? 'Full name deleted from prefrence');
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil<void>(
            context,
            MaterialPageRoute<void>(builder: (BuildContext context) => const LoginScreen()),
            ModalRoute.withName('/'),
          );
          Get.snackbar('Successfully',data['message']);
        }else {
          Get.snackbar('Failed', data['message']);
        }
      }else {
        Get.back();
        Get.snackbar('Failed', 'Something went wrong try again');
      }
    } catch(e) {
      debugPrint(e.toString());
      Get.back();
      Get.snackbar('Failed', 'Something went wrong try again');

    }
  }

    // Delete business account
  Future deleteBusinessAccount(String businessAccount, BuildContext context) async {
    try {
      Constant.showDialog();
      debugPrint(Apis.deleteBusinessApi + businessAccount);
      final response = await delete(Uri.parse(Apis.deleteBusinessApi + businessAccount));
      var data = jsonDecode(response.body.toString());

      if(response.statusCode == 200) {
        Get.back();
        if(data['success'] == true){
          SessionController.removeBusinessPorfileFromPreferences();
          debugPrint(SessionController().user!.data?.email ?? 'Email deleted from prefrence');
          debugPrint(SessionController().user!.data?.fullName ?? 'Full name deleted from prefrence');
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil<void>(
            context,
            MaterialPageRoute<void>(builder: (BuildContext context) => const LoginScreen()),
            ModalRoute.withName('/'),
          );
          Get.snackbar('Successfully',data['message']);
        }else {
          Get.snackbar('Failed', data['message']);
        }
      }else {
        Get.back();
        Get.snackbar('Failed', 'Something went wrong try again');
      }
    } catch(e) {
      debugPrint(e.toString());
      Get.back();
      Get.snackbar('Failed', 'Something went wrong try again');

    }
  }
} 