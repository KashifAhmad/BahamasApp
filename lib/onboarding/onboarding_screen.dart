import 'package:bahamas/onboarding/intro_screen/intro_screen1.dart';
import 'package:bahamas/onboarding/intro_screen/intro_screen2.dart';
import 'package:bahamas/onboarding/intro_screen/intro_screen3.dart';
import 'package:bahamas/onboarding/onboard_account_check_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: Get.width * 0.9,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageViewController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotColor: AppTextTheme.color181818.withOpacity(0.20),
                      activeDotColor: AppTextTheme.color181818,
                      dotWidth: 8,
                      dotHeight: 5,
                      strokeWidth: 0
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => const OnboardingAccountCheckScreen()
                      ));
                    },
                    child: Text(
                      'Skip',
                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                        fontFamily: AppTextTheme.ttHovesMedium,
                        color: AppTextTheme.color858993
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.033),
            Expanded(
              child: PageView(
                controller: pageViewController,
                 children: [
                    IntroScreen1(pageController: pageViewController),
                    IntroScreen2(pageController: pageViewController),
                    IntroScreen3(pageController: pageViewController),
                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}