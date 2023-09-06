
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSocialProfileStep3 extends StatefulWidget {
  const AddSocialProfileStep3({super.key});

  @override
  State<AddSocialProfileStep3> createState() => _AddSocialProfileStep3State();
}

class _AddSocialProfileStep3State extends State<AddSocialProfileStep3> {

  BusinessProfileController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.facebookController.clear();
    controller.instagramController.clear();
    controller.twitterController.clear();
    controller.whatsappController.clear();
    controller.websiteUrlController.clear();
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
                          'Step 3 of 3',
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
                      'Add socials',
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
                      'Add your social platforms to help users get in touch with you',
                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.none,
                        fontFamily: AppTextTheme.ttHovesMedium,
                        color: AppTextTheme.color2D2D33.withOpacity(0.50)
                      )
                    ),
                  ),
                
                  
                  SizedBox(height: Get.height * 0.05),
                  // Facebook Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: controller.facebookController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Facebook',
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
                          hintText: "Enter username",
                          fillColor: Colors.white   
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Instagram Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: controller.instagramController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Instagram',
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
                          hintText: "Enter username",
                          fillColor: Colors.white  
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Twitter Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: controller.twitterController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Twitter',
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
                          hintText: "Enter username",
                          fillColor: Colors.white 
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Whatsapp Texformtfield
                  Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextField(
                                controller: controller.whatsappController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Whatsapp',
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
                                  ),
                                  prefixIcon: CountryCodePicker(
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: '+1', 
                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33,
                                  ),
                                    showFlag: false,
        
                                    //showFlagDialog: true,
                                    //comparator: (a, b) => b.name.compareTo(a.name),
                                    //Get the country information relevant to the initial selection
                                    //onInit: (code) => print("${code.name} ${code.dialCode}"),
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
                  // Website Url Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: controller.websiteUrlController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Website URL',
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
                          hintText: "https://",
                          fillColor: Colors.white  
                        ),
                      )
                    ),
                  ),
                  
                  // Continue button
                  SizedBox(height: Get.height * 0.04),
                  GestureDetector(
                              onTap: () {
                                 FocusScope.of(context).unfocus();
                                if(controller.facebookController.text.isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                     'Please enter facebook username.'
                                  );
                                } else if(controller.instagramController.text.isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                     'Please enter instagram username.'
                                  );
                                } else if(controller.twitterController.text.isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                     'Please enter twitter username.'
                                  );
                                } else if(controller.whatsappController.text.isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                     'Please enter whatsapp number.'
                                  );
                                } else if(controller.websiteUrlController.text.isEmpty) {
                                  Constant.showSnackBar(
                                    'Wait...',
                                     'Please enter website url.'
                                  );
                                } else {
                                  controller.createBusinessProfile();
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