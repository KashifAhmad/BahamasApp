import 'dart:async';
import 'package:bahamas/Business_side/business_bottom_navigationbar/business_bottombar.dart';
import 'package:bahamas/Business_side/create_business_profile/businesss_profile_step1_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/repositories/auth_repository.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/main_authentication/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  // Signup Text Fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // SignIn Text feilds
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // verify code screen
  TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    codeController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    otpTimer!.cancel();
  }

  RxString accountType = ''.obs;
  int otpTimeinSec = 30;
  RxString countryCode = ''.obs;
  RxBool isPasswordShow  = false.obs;
  RxBool isConfirmPasswordShow = false.obs;
  Timer? otpTimer;
  RxInt startOtp = 30.obs;


  // Sign Up with email
    Future signUpWithEmail(dynamic data, BuildContext context) async {
      Constant.showDialog();
    await AuthRepository().signUpWithEmail(data).then((value) async {
      Get.back();
      if (value['success'] == true) {
        // forgotPasswordWithEmail();
        Get.to(() => const VerifyCodeScreen());
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
      } 
      else if(error.toString().contains('Password and confirm password must be same? Please try again')) {
          Constant.showSnackBar('Error', 'Password not same');
      } else if(error.toString().contains('Dup User account cannot be created!')) {
          Constant.showSnackBar('Error', 'Email already used');
      } else if(error.toString().contains('Error in Registering User. Please try again')) {
          Constant.showSnackBar('Error', 'Email already used');
      }
      else {
        Constant.showSnackBar('Error', error.toString());
      }
    });
  }

  // Sign In with email
  Future signInWithEmail(dynamic data, BuildContext context) async {
    Constant.showDialog();
    await AuthRepository().loginRepo(data).then((value) async {
      Get.back();
      if (value['success'] == true) {
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const BusinessBottomNavigationBar()),
          ModalRoute.withName('/'),
        );
      }  else {
          Constant.showSnackBar('Error', value['message'].toString());
      }
    }).onError((error, stackTrace) {
      debugPrint('Auth Error: $error');
      Get.back();
      if(error.toString() == 'Error During Communication No Internet Connection') {
        Constant.showSnackBar('Error', 'No Internet Connection');
      } else if(error.toString() == 'TimeoutException after 0:00:20.000000: Future not completed'){
        Constant.showSnackBar('Request timeout', 'Please check internet connection.');
      } else if(error.toString().contains('Invalid password!. PLease try again')){
        Constant.showSnackBar('Error', 'Invalid password!. PLease try again');
      } else if(error.toString().contains('User Email does not exist')){
        Constant.showSnackBar('Error', 'User Email does not exist');
      } else if(error.toString().contains('User does not exist')){
        Constant.showSnackBar('Failed', 'User does not exist');
      }else {
        Constant.showSnackBar('Error', error.toString());
      }
    });
  }

  Duration oneSec = const Duration(seconds: 1);

  // ignore: non_constant_identifier_names
  Future OtpTimer() async {
    otpTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startOtp.value == 0) {
          timer.cancel();
        } else {
          startOtp.value--;
        }
      },
    );
  }

  // forgot password with Email
  Future forgotPasswordWithEmail() async {
    try {
      Constant.showDialog();
      dynamic data = {"email": emailController.text.trim().toString()};
      await AuthRepository().forgotPasswordRepo(data).then((value) async {
        Get.back();
        if (value['success'] == true) {
          otpTimer != null ? otpTimer!.cancel() : otpTimer;
          startOtp.value = otpTimeinSec;
          await OtpTimer();
          if(value['message'] == 'Password Reset Code sent successfully. Now verify your email code') {
            Constant.showSnackBar('Successfull', 'Verification code has been sent to email}');
            Get.to(() => const VerifyCodeScreen());
          }
        } else {
          Constant.showSnackBar('Failed', value['message']);
        }
      }).onError((error, stackTrace) {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Verify code
  Future verifyCodeApi(String email, String pinCode, BuildContext context) async {
    try {
      Constant.showDialog();
      await AuthRepository().verifyCode(email, pinCode).then((value) async {
        Get.back();
        if(value['status'] == 200) {
          if (value['success'] == true) {
            if(SessionController().user?.data?.profileType != null) {
              SessionController().user?.data?.profileType.toString() == 'User'
              ?
              // ignore: use_build_context_synchronously
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(builder: (BuildContext context) => const BusinessBottomNavigationBar()),
                  ModalRoute.withName('/'),
              )
              :
              Get.to(() => const BusinessProfileStep1());
              Constant.showSnackBar('Successfull', '${value['message']}');
            } else {
              Get.back();
              Constant.showSnackBar('Failed', 'Profile type is null');
            }
          } else {
            debugPrint('success false');
            Get.back();
            Constant.showSnackBar('Failed', value['message']);
          }
        } else {
          debugPrint('status code issue');
          Constant.showSnackBar('Failed', value['message']);
          Get.back();
        }      
      }).onError((error, stackTrace) {});
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
    }
  }

  // Reset Password
  // Future resetPassword() async {
  //   try {
  //     Constant.showDialog();
  //     dynamic data = {
  //       "email": forgetEmailController.text.trim().toString(),
  //       "code": pinCode.value,
  //       "password": newPasswordController.text.trim().toString()
  //     };
  //     if (kDebugMode) {
  //       print(data);
  //     }
  //     await AuthRepository().resetPasswordRepo(data).then((value) {
  //       Get.back();
  //       if (value['success'] == true) {
  //         Constant.showSnackBar(
  //             '${value['message']}', 'Please login with email and password.');
  //         Get.offAllNamed(AppRoutes.loginWIthEmailScreen);
  //       } else {
  //         Constant.showSnackBar('Failed', '${value['message']}');
  //       }
  //     }).onError((error, stackTrace) {
  //       debugPrint('Errorrrr: $error');
  //       Get.back();
  //       Constant.showSnackBar('Failed', error.toString());
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     Get.back();
  //   }
  // }

}
