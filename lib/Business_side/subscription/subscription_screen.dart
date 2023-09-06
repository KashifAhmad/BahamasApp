import 'package:bahamas/Business_side/business_bottom_navigationbar/business_bottombar.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.03),
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
                    'Choose your plan',
                    style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesDemiBold,
                      color: AppTextTheme.color2D2D33,
                    )
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Text(
                    'Choose subscription package to\ncontinue.',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    ),
                  ),
                ),
              
                
                SizedBox(height: Get.height * 0.05),
      
                Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(45, 45, 45, 1),
                      width: 1,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.05),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTextTheme.colorFEF8DC,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Free trail for 30 days',
                              style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              'Basic Trail Pack',
                              style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Edit/Update your business',
                               style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Basic analytics',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- One business profile',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      GestureDetector(
                        onTap: () {
                        modalBottomSheet(context);
                          Future.delayed(const Duration(seconds: 2), () {
                             Navigator.pushAndRemoveUntil<void>(
                              context,
                              MaterialPageRoute<void>(builder: (BuildContext context) => const BusinessBottomNavigationBar()),
                              ModalRoute.withName('/'),
                            );
                          });
                        },
                        child: Center(
                          child: SizedBox(
                            height: Get.height * 0.06,
                            width: Get.width * 0.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTextTheme.colorF8D20F,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Text(
                                    'Start trail',
                                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.color2D2D33
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),      
                Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(171, 178, 196, 1),
                      width: 1,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorFEF8DC,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Monthly',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorF1F1F1,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Cancel anytime',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '\$7.99 /month',
                              style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Edit/Update your business',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Professional analytics',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Multiple business profile',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                       GestureDetector(
                        onTap: () {
                        },
                        child: Center(
                          child: SizedBox(
                            height: Get.height * 0.06,
                            width: Get.width * 0.8,
                              child: Container(
                               decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppTextTheme.colorABB2C4
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose Plan',
                                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.color2D2D33
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),      
                Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(171, 178, 196, 1),
                      width: 1,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorFEF8DC,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Yearly',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorF1F1F1,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Cancel anytime',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ),
                          ),
      
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        children: [
                          Padding(
                                padding: EdgeInsets.only(left: Get.width * 0.06),
                                child: Text(
                                  '\$81.99 /month',
                                  style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                          ),
                           Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTextTheme.colorF8D20F,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Save: \$13.99',
                                  style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Edit/Update your business',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Professional analytics',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.06),
                            child: Text(
                              '- Multiple business profile',
                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33.withOpacity(0.60)
                              ),
                            ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Center(
                          child: SizedBox(
                            height: Get.height * 0.06,
                            width: Get.width * 0.8,
                              child: Container(
                               decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppTextTheme.colorABB2C4
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Text(
                                    'Choose Plan',
                                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.color2D2D33
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.04),      
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void modalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            height: Get.height * 0.4,
            width: Get.width,
            color: Colors.white,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [

              Text(
                'Starting your free trail',
                style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                  decoration: TextDecoration.none,
                  fontFamily: AppTextTheme.ttHovesMedium,
                  color: AppTextTheme.color2D2D33
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Your 30 days trail is started, enjoy\nyour free version.',
                textAlign: TextAlign.center,
                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                  decoration: TextDecoration.none,
                  fontFamily: AppTextTheme.ttHovesMedium,
                  color: AppTextTheme.color2D2D33.withOpacity(0.50)
                ),
              ),
              Text(
                'You can subscribe to premium package\nonce trail version ends.',
                textAlign: TextAlign.center,
                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                  decoration: TextDecoration.none,
                  fontFamily: AppTextTheme.ttHovesMedium,
                  color: AppTextTheme.color2D2D33.withOpacity(0.50)
                ),
              ),
            ],
           ),
          );
      }
    );
}