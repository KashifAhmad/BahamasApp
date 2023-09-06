import 'package:bahamas/onboarding/onboard_account_check_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IntroScreen3 extends StatefulWidget {
  PageController pageController;
  IntroScreen3({super.key, required this.pageController});

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
   Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: Get.height * 0.429,
            width: Get.width,
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/onboard3.png',
                  height: Get.height * 0.4,
                  width: Get.width * 0.9,
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            height: Get.height * 0.4,
            width: Get.width,
            child: Column(
              children: [
                // SizedBox(height: Get.height * 0.04),
                SizedBox(
                  width: Get.width * 0.85,
                  child: Text(
                    'Filter out your favourite places',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                      fontFamily: AppTextTheme.ttHovesDemiBold,
                      color: AppTextTheme.color2D2D33
                    )
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                SizedBox(
                  width: Get.width * 0.85,
                  child: Text(
                    'Ratings help user to understand the value and professionalism of a business.',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color858993
                    ),
                  ),
                ),
                // SizedBox(height: Get.height * 0.05),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => const OnboardingAccountCheckScreen()
                    ));
                  },
                  child: SizedBox(
                    height: Get.height * 0.06,
                    width: Get.width * 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(248, 210, 15, 1),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color181818
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    ); 
  }
}