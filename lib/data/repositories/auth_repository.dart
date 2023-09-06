import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {

  // SignUp with email
  Future<dynamic> signUpWithEmail(var data) async {
    try {
      debugPrint(Apis.createUserApi);
      var response = await NetworkApiService().getPostApiResponse(
          Apis.createUserApi, data);
      debugPrint("SignUp Response: $response");
      // if (response['success'] == true) {
      //   debugPrint("After success Response: $response");
      //   await SessionController.saveUserInPreference(response);
      //   await SessionController.getUserFromPreference();
      //   debugPrint('check profile type inside create user: ${SessionController().user?.data?.profileType.toString()}');
      // }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // SignIn with email and password
  Future<dynamic> loginRepo(var data) async {
    try {
      debugPrint(Apis.emailLoginApi);
      var response = await NetworkApiService().getPostApiResponse(
          Apis.emailLoginApi, data);
      debugPrint("SignIn Response: $response");
      if (response['success'] == true) {
        await SessionController.saveUserInPreference(response);
        await SessionController.getUserFromPreference();
        debugPrint('check profile type inside login: ${SessionController().user!.data!.profileType.toString()}');
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Forgot password / send code with email
  Future<dynamic> forgotPasswordRepo(dynamic data) async {
    try {
      debugPrint(Apis.forgetPasswordApi);
      var response = await NetworkApiService()
          .getPostApiResponse(Apis.forgetPasswordApi, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Verify code
  Future<dynamic> verifyCode(String email, String pinCode) async {
    try {
      // debugPrint('${Apis.verifyCodeApi}$userId/$pinCode');
      debugPrint('${Apis.verifyCodeApi}email=$email&code=$pinCode');
      var response = await NetworkApiService()
          .getGetApiResponse('${Apis.verifyCodeApi}email=$email&code=$pinCode');
          // .getGetApiResponse('${Apis.verifyAccountApi}$userId/$pinCode');
      if (response['success'] == true) {
        debugPrint("After success Response: $response");
        await SessionController.saveUserInPreference(response);
        await SessionController.getUserFromPreference();
        debugPrint('check profile type inside verify user: ${SessionController().user?.data?.profileType.toString()}');
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  } 

  // Resend Code
  // Future<dynamic> reSendCode(Map data) async {
  //   String url = AppConfig.reSendCode;
  //   if (kDebugMode) {
  //     print(url);
  //   }
  //   final response = await BaseClientClass.post(
  //     url,
  //     data,
  //   );
  //   if (response is http.Response) {
  //     return ResendCodeModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     return response;
  //   }
  // }
 
  // Reset Password
  Future<dynamic> resetPasswordRepo(dynamic data) async {
    try {
      var response = await NetworkApiService()
          .getPostApiResponse(Apis.resetPasswordApi, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Delete User Token
  // Future<dynamic> deleteUserToken(dynamic data) async {
  //   try {
  //     var response = await NetworkApiService()
  //         .getPostApiResponse(Apis.removeTokenUrl, data);
  //     return response;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}
