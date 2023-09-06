import 'package:bahamas/main_authentication/create_screen1.dart';
import 'package:bahamas/main_authentication/login_account_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingAccountCheckScreen extends StatefulWidget {
  const OnboardingAccountCheckScreen({super.key});

  @override
  State<OnboardingAccountCheckScreen> createState() => _OnboardingAccountCheckScreenState();
}

class _OnboardingAccountCheckScreenState extends State<OnboardingAccountCheckScreen> {

  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/onboard4.png',
              height: Get.height * 0.6,
              width: Get.width,
            ),
            const Spacer(),
            const SizedBox()
          ]
        ),
        Column(
            children: [
              const Spacer(),
              SizedBox(
                width: Get.width * 0.8,
                child: Text(
                  "Let’s upgrade your exploring experience",
                  style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                    decoration: TextDecoration.none,
                    fontFamily: AppTextTheme.ttHovesDemiBold,
                    color: AppTextTheme.white
                  )
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Padding(
                padding: EdgeInsets.only(bottom: Get.height * 0.03),
                child: SizedBox(
                  width: Get.width * 0.8,
                  child: Text(
                    'Changing the way people explore different businesses by providing interactive solutions.',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.white.withOpacity(0.70)
                    )
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.48,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.02),
                    SizedBox(
                      height: 5,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTextTheme.colorD9D9D9,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),

                    // create button
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CreateScreen());
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
                              'Create an account',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color181818
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // login with email button
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppTextTheme.colorABB2C4,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Text(
                              'Log in with email',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color181818
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: Get.height * 0.02),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 1,
                            width: Get.width * 0.28,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorABB2C4,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Continue using',
                            style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                              decoration: TextDecoration.none,
                              fontFamily: AppTextTheme.ttHovesMedium,
                              color: AppTextTheme.colorABB2C4
                            )
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 1,
                            width: Get.width * 0.28,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorABB2C4,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // countinue with google button
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppTextTheme.colorABB2C4,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                               child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: Get.width * 0.02),
                                child: Image.asset(
                                  'assets/icons/google_icon.png',
                                  height: 25,
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: Get.width * 0.1),
                               Text(
                                'Continue using Google',
                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color181818
                                )
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                    // countinue with facebook button
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppTextTheme.colorABB2C4,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: Get.width * 0.02),
                                child: Image.asset(
                                  'assets/icons/fb_icon.png',
                                  height: 25,
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: Get.width * 0.1),
                              Text(
                                'Continue using Facebook',
                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color181818
                                )
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
        )
      ]
    );
  }
}