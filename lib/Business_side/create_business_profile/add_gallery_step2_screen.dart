import 'package:bahamas/Business_side/create_business_profile/add_photo_gallery_tile.dart';
import 'package:bahamas/Business_side/create_business_profile/add_socials_step3_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGalleryBusinessProfileStep2 extends StatefulWidget {
  const AddGalleryBusinessProfileStep2({super.key});

  @override
  State<AddGalleryBusinessProfileStep2> createState() => _AddGalleryAboutBusinessProfileStep2State();
}

class _AddGalleryAboutBusinessProfileStep2State extends State<AddGalleryBusinessProfileStep2> {

  BusinessProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // bottom: false,
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
                        'Step 2 of 3',
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
                    'Add Gallery',
                    style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesDemiBold,
                    )
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
                SizedBox(
                  width: Get.width * 0.9,
                  child:  Text(
                    'Showcase your business by uploading videos or images of it.',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    )
                  ),
                ),
              
                
                SizedBox(height: Get.height * 0.05),
                
                // SizedBox(
                //   width: Get.width * 0.9,
                //   child: GridView.count(
                //       crossAxisCount: 2,  
                //       physics:const NeverScrollableScrollPhysics(),
                //       crossAxisSpacing: Get.width * 0.05,  
                //       mainAxisSpacing: 20,
                //       shrinkWrap: true,
                //       childAspectRatio: (1 / 1.3),
                //       children: List.generate(4, (index) {  
                //         return GestureDetector(
                //           onTap: () { 
                //           },
                //           child: DottedBorder(
                //             borderType: BorderType.RRect,
                //             color: AppTextTheme.color828898,
                //             radius: const Radius.circular(20),
                //             dashPattern: const [5,5],
                //              child: Center(
                //                child: Icon(
                //                 Icons.add,
                //                 color: AppTextTheme.color828898,
                //                 size: 30,
                //                ),
                //              ),
                //           ),
                //         );  
                //       }  
                //     )  
                //   ),
                // ),  
                
                SizedBox(
                  width: Get.width * 0.9,
                  child: GetBuilder<BusinessProfileController>(
                    init: BusinessProfileController(),
                    builder: (value1) {
                      return StaggeredGrid.count(
                        axisDirection: AxisDirection.down,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.3,
                            child: AddProfilePhotoTile(
                              index: 0,
                              controller: value1,
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.3,
                            child: AddProfilePhotoTile(
                              index: 1,
                              controller: value1,
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.3,
                            child: AddProfilePhotoTile(
                              index: 2,
                              controller: value1,
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.3,
                            child: AddProfilePhotoTile(
                              index: 3,
                              controller: value1,
                            ),
                          ),
                        ],
                      );
                  }),
                ),
         
                // Continuess button
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (controller.addImagesList.isEmpty) {
                      Constant.showSnackBar(
                          'Add Image', 'Please add at least one photo to continue');
                    } else {
                      Get.to(() => const AddSocialProfileStep3());
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}