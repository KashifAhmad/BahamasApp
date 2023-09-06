import 'package:bahamas/data/controller/auth_controller.dart';

import 'package:bahamas/main_authentication/create_sscreen2.dart';
import 'package:bahamas/main_authentication/login_account_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  AuthController authController = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: 
       Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(
              'assets/images/create_screen_bg.png',
            ),
            fit: BoxFit.fill
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.13),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Text(
                    'Begin an exclusive journey to help make The Bahamas a better place.',
                    style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesDemiBold,
                      color: AppTextTheme.color2D2D33,
                    )
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Container(
                  height: 1,
                  width: Get.width * 0.9,
                  color: Colors.black,
                ),
                SizedBox(height: Get.height * 0.03),
                GestureDetector(
                   onTap: () {
                    authController.accountType.value = 'User';
                    debugPrint(authController.accountType.value);
                    Get.to(() => const CreateAccountScreen());
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Text(
                            'Here to explore',
                            style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                              decoration: TextDecoration.none,
                              fontFamily: AppTextTheme.ttHovesMedium,
                              color: AppTextTheme.color2D2D33,
                            )
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.75,
                                child: Text(
                                  'Create user profile',
                                  style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesDemiBold,
                                    color: AppTextTheme.color2D2D33,
                                  )
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/icons/forword_arrow.png',
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.06),
                Container(
                  height: 1,
                  width: Get.width * 0.9,
                  color: Colors.black,
                ),
                SizedBox(height: Get.height * 0.03),
                GestureDetector(
                  onTap: () {
                    authController.accountType.value = 'Business';
                    debugPrint(authController.accountType.value);
                    Get.to(() => const CreateAccountScreen());
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Text(
                            'Here to expand',
                            style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                              decoration: TextDecoration.none,
                              fontFamily: AppTextTheme.ttHovesMedium,
                              color: AppTextTheme.color2D2D33,
                            )
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.75,
                                child: Text(
                                  'Create business profile',
                                  style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesDemiBold,
                                    color: AppTextTheme.color2D2D33,
                                  )
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/icons/forword_arrow.png',
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.06),
                        Container(
                          height: 1,
                          width: Get.width * 0.9,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                  SizedBox(height: Get.height * 0.04),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: GestureDetector(
                            onTap: () {
                              debugPrint('Already have an account tapped');
                              Get.to(() => const LoginScreen());
                            },
                            child: Text(
                              'Already have an account',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33,
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.08),
                        GestureDetector(
                                onTap: () {
                                  Get.to(() => const LoginScreen());
                                },
                                child: SizedBox(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.9,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.color2D2D33,
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                        decoration: TextDecoration.none,
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.colorFFFEFB,
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: Get.height * 0.08),
              ],
            ),
          ),
        ),
    );
  }
}