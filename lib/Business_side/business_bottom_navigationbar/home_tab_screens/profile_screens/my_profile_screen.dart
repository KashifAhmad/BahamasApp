import 'dart:io';

import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/business_review_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/change_password_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/edit_profile_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/payment_method_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/subscription_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/profile_controller.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/onboarding/onboard_account_check_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  ProfileController profileController = Get.find();
  String? imageLink;

  @override
  void initState() {
    super.initState();
    imageLink = SessionController().user!.data!.image ?? '';
    profileController.bio.value = SessionController().user!.data!.bioData ?? '';
    profileController.name.value = SessionController().user!.data!.fullName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Obx(() =>
                Column(
                  children: [
                    SizedBox(height: Get.height * 0.02),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'Business' ? true : false,
                      child: SizedBox(
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
                              "My Profile",
                               style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33
                              )
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                     Visibility(
                      visible: SessionController().user!.data!.profileType == 'Business' ? false : true,
                       child: SizedBox(
                        width: Get.width * 0.9,
                         child: Row(
                           children: [
                             Text(
                                "My Profile",
                                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                  fontFamily: AppTextTheme.ttHovesDemiBold,
                                  color: AppTextTheme.color2D2D33
                                )
                              ),
                           ],
                         ),
                       ),
                     ),
                    SizedBox(height: Get.height * 0.05),
                    // profile image, name container
                    Container(
                            width: Get.width * 0.75,
                            decoration: BoxDecoration(
                              color: AppTextTheme.colorFFFDF5,
                              border: Border.all(
                                width: 1,
                                color: AppTextTheme.colorF9EFC0,
                              ),
                              borderRadius: BorderRadius.circular(9.0)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Obx(() => profileController.imageFilePath.value != ""
                                  ? Container(
                                    height: 70,
                                    width: 70,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0)
                                    ),
                                    child: Image.file(
                                      File(profileController.imageFilePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                  : imageLink != null
                                      ? SizedBox(
                                          height: 70,
                                          width: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Image.network(
                                            imageLink!,
                                            fit: BoxFit.cover,
                                            height: 70,
                                            width: 70,
                                            loadingBuilder:
                                                (context, child, loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Container(
                                                height: 70,
                                                width: 70,
                                                color: Colors.grey.withOpacity(0.3),
                                                child: SizedBox(
                                                    height: Get.height * 0.24,
                                                    child: const Center(
                                                        child: CircularProgressIndicator()
                                                  )
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, child, loadingProgress) {
                                              return Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(16.0),
                                                        border: Border.all(
                                                            width: 0.5,
                                                            color: Colors.grey)
                                                        ),
                                                    child: Icon(
                                                      Icons.person_2_outlined,
                                                      color: Colors.grey.withOpacity(0.5),
                                                      size: 50,
                                                    )
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                      : const SizedBox()),
                                  
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                    child: Text(
                                      profileController.name.value,
                                      // "Danyal Saif",
                                      textAlign: TextAlign.center,
                                      style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.color2D2D33
                                      )
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                    child: Text(
                                      profileController.bio.value,
                                      // "Love food, traveling, fishing and diving",
                                      textAlign: TextAlign.center,
                                      style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.color2D2D33.withOpacity(0.70)
                                      )
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                    ),
                    
                    const SizedBox(height: 40),
                    // Business reviews
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const BusinessReviewsScreen());
                      },
                      child: ListTile(
                        leading: Image.asset(
                          Constant.businessReviewsIcon,
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                         SessionController().user!.data!.profileType == 'User' ? "My reviews" : "Business reviews",
                          style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33,
                          )
                        ),
                        trailing: Image.asset(
                          Constant.greaterIcon,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Edit profile
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const EditProfileScreen());
                      },
                      child: ListTile(
                        leading: Image.asset(
                          Constant.profileEditIcon,
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          "Edit profile",
                          style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33,
                          )
                        ),
                        trailing: Image.asset(
                          Constant.greaterIcon,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Change password
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ChangePasswordScreen());
                      },
                      child: ListTile(
                        leading: Image.asset(
                          Constant.changePasswordIcon,
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          "Change password",
                          style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33,
                          )
                        ),
                        trailing: Image.asset(
                          Constant.greaterIcon,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Subscription
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: Container(
                        height: 1,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppTextTheme.black.withOpacity(0.10)
                        ),
                      ),
                    ),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: const SizedBox(height: 5)
                    ),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const EditSubscriptionScreen());
                        },
                        child: ListTile(
                          leading: Image.asset(
                            Constant.subscriptionIcon,
                            height: 24,
                            width: 24,
                          ),
                          title: Text(
                            "Subscription",
                            style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                              decoration: TextDecoration.none,
                              fontFamily: AppTextTheme.ttHovesMedium,
                              color: AppTextTheme.color2D2D33,
                            )
                          ),
                          trailing: Image.asset(
                            Constant.greaterIcon,
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: const SizedBox(height: 5)
                    ),
                    // Payment method
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: Container(
                        height: 1,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppTextTheme.black.withOpacity(0.10)
                        ),
                      ),
                    ),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: const SizedBox(height: 5)
                    ),
                    Visibility(
                      visible: SessionController().user!.data!.profileType == 'User' ? false : true,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const PaymentMethodScreen());
                        },
                        child: ListTile(
                          leading: Image.asset(
                            Constant.paymentMethodIcon,
                            height: 24,
                            width: 24,
                          ),
                          title: Text(
                            "Payment method",
                            style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                              decoration: TextDecoration.none,
                              fontFamily: AppTextTheme.ttHovesMedium,
                              color: AppTextTheme.color2D2D33,
                            )
                          ),
                          trailing: Image.asset(
                            Constant.greaterIcon,
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // About us
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: Image.asset(
                        Constant.aboutUsIicon,
                        height: 24,
                        width: 24,
                      ),
                      title: Text(
                        "About us",
                        style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesMedium,
                          color: AppTextTheme.color2D2D33,
                        )
                      ),
                      trailing: Image.asset(
                        Constant.greaterIcon,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Delete business
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        debugPrint('deleteeee press');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                'Delete Account',
                                style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(          
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesDemiBold,
                                  color: AppTextTheme.black
                                )
                              ),
                              content: Text(
                                'Are you sure you want to delete an account?',
                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(          
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesRegular,
                                  color: AppTextTheme.black
                                )
                              ),
                                actions: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(          
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.black
                                    )
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    // SessionController().user!.data!.profileType == 'User' 
                                    // ?
                                    profileController.deleteAccount(SessionController().user!.data!.email ?? '', context);
                                    // :
                                    // profileController.deleteBusinessAccount(SessionController().user!.data!.email ?? '', context);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(          
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.black
                                    )
                                  ),
                                ),
                              ],
                            );
                            },
                        );
                      
                      },
                      child: ListTile(
                        leading: Image.asset(
                          Constant.deleteBusinessIcon,
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          SessionController().user!.data!.profileType == 'User' ? "Delete account" :  "Delete business",
                          style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33,
                          )
                        ),
                        trailing: Image.asset(
                          Constant.greaterIcon,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    
                    Container(
                      height: 1,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppTextTheme.black.withOpacity(0.10)
                      ),
                    ),
                    // Logout button
                    SizedBox(height: Get.height * 0.05),
                    GestureDetector(
                      onTap: () async{
                        await SessionController.removeUserFromPreferences();
                        await SessionController.removeBusinessPorfileFromPreferences();
                         // ignore: use_build_context_synchronously
                         Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const OnboardingAccountCheckScreen()),
                          ModalRoute.withName('/'),
                        );
                      },
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppTextTheme.colorABB2C4
                          ),
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Text(
                            'Logout',
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
      ),
    );
  }
}