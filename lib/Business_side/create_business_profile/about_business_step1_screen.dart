import 'package:bahamas/Business_side/create_business_profile/add_gallery_step2_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutBusinessProfileStep1 extends StatefulWidget {
  const AboutBusinessProfileStep1({super.key});

  @override
  State<AboutBusinessProfileStep1> createState() => _AboutBusinessProfileStep1State();
}

class _AboutBusinessProfileStep1State extends State<AboutBusinessProfileStep1> {

  BusinessProfileController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.aboutBusinessController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                        Text(
                          'Step 1 of 3',
                          style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color858993,
                          )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Text(
                      'Write about business',
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
                      'Tell more about your business, a short description to represent.',
                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.none,
                        fontFamily: AppTextTheme.ttHovesMedium,
                        color: AppTextTheme.color2D2D33.withOpacity(0.50)
                      )
                    ),
                  ),
                
                  
                  SizedBox(height: Get.height * 0.05),
                  // multi Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: controller.aboutBusinessController,
                        maxLines: 7,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Business name',
                          // add here
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesMedium,
                          color: AppTextTheme.color828898,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ), 
                          filled: true,
                        hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesMedium,
                          color: AppTextTheme.color2D2D33.withOpacity(0.30),
                        ),
                        hintText: "Tell us about your business",
                        fillColor: Colors.white  
                        ),
                      )
                    ),
                  ),
                  
                  // Continue button
                  SizedBox(height: Get.height * 0.1),
                  GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if(controller.aboutBusinessController.text.toString().isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                    'Please enter about your business.'
                                  );
                                } else {
                                  Get.to(() => const AddGalleryBusinessProfileStep2());
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
                                      'Continue',
                                     style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                        decoration: TextDecoration.none,
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.color2D2D33
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