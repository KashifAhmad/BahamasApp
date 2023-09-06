import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/profile_controller.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  ProfileController profileController = Get.find();

  @override
  void initState() {
    super.initState();
    profileController.oldPasswordController.clear();
    profileController.newPasswordController.clear();
    profileController.confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.02),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'assets/icons/back_arrow.png',
                            height: 24,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Text(
                      'Change password',
                      style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                        decoration: TextDecoration.none,
                        fontFamily: AppTextTheme.ttHovesDemiBold,
                        color: AppTextTheme.color2D2D33
                      )
                    ),
                  ),
                  
                  SizedBox(height: Get.height * 0.015),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Text(
                      'Update your account password',
                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.none,
                        fontFamily: AppTextTheme.ttHovesMedium,
                        color: AppTextTheme.color2D2D33.withOpacity(0.50)
                      )
                    ),
                  ),
        
                  SizedBox(height: Get.height * 0.05),
                  Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: profileController.oldPasswordController,
                            obscureText: profileController.isOldPasswordShow.value ? false : true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'Old password',
                              suffix: GestureDetector(
                                onTap: () {
                                  setState((){
                                    profileController.isOldPasswordShow.value = !profileController.isOldPasswordShow.value;
                                  });
                                },
                                child: Text(
                                  profileController.isOldPasswordShow.value ? 'Hide' : 'Show',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898
                                  ),
                                )
                              ),
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898
                              ),
                              border: OutlineInputBorder(
                                 borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),  
                            ),
                          )
                      ),
                   ),
                  SizedBox(height: Get.height * 0.03),
                  Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: profileController.newPasswordController,
                            obscureText: profileController.isNewPasswordShow.value ? false : true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'New password',
                              suffix: GestureDetector(
                                onTap: () {
                                  setState((){
                                    profileController.isNewPasswordShow.value = !profileController.isNewPasswordShow.value;
                                  });
                                },
                                child: Text(
                                  profileController.isNewPasswordShow.value ? 'Hide' : 'Show',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898
                                  ),
                                )
                              ),
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898
                              ),
                              border: OutlineInputBorder(
                                 borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),  
                            ),
                          )
                      ),
                   ),
                  SizedBox(height: Get.height * 0.03),
                  Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: profileController.confirmPasswordController,
                            obscureText: profileController.isConfirmPasswordShow.value ? false : true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'Confirm new password',
                              suffix: GestureDetector(
                                onTap: () {
                                  setState((){
                                    profileController.isConfirmPasswordShow.value = !profileController.isConfirmPasswordShow.value;
                                  });
                                },
                                child: Text(
                                  profileController.isConfirmPasswordShow.value ? 'Hide' : 'Show',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898
                                  ),
                                )
                              ),
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898
                              ),
                              border: OutlineInputBorder(
                                 borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),  
                            ),
                          )
                      ),
                   ),
                  
                  // Verify button
                  SizedBox(height: Get.height * 0.03),
                  GestureDetector(
                              onTap: () {
                                var data = {
                                  'email': SessionController().user!.data!.email ?? '',
                                  'oldPassword': profileController.oldPasswordController.text.trim().toString(),
                                  'newPassword': profileController.newPasswordController.text.trim().toString(),
                                  'confirmPassword': profileController.confirmPasswordController.text.trim().toString(),
                                };
                                if(profileController.oldPasswordController.text.trim().isEmail 
                                    || profileController.newPasswordController.text.trim().isEmail
                                    || profileController.confirmPasswordController.text.trim().isEmail
                                ) {
                                  Constant.showSnackBar('Wait', 'Please fill are required fileds');
                                } else {
                                  profileController.changePassword(data);
                                }
                              },
                              child: SizedBox(
                                height: Get.height * 0.07,
                                width: Get.width * 0.9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppTextTheme.colorF8D20F,
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Update password',
                                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                        decoration: TextDecoration.none,
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.color181818,
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                 
                  SizedBox(height: Get.height * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}