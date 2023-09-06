import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class EditGalleryScreen extends StatefulWidget {
  const EditGalleryScreen({super.key});

  @override
  State<EditGalleryScreen> createState() => _EditGalleryScreenState();
}

class _EditGalleryScreenState extends State<EditGalleryScreen> {

  BusinessProfileController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.gallery.clear();
    debugPrint(SessionController().businessProfile?.data?.gallery?.length.toString());
    controller.gallery.addAll(SessionController().businessProfile?.data?.gallery ?? []);
  }

  @override
  Widget build(BuildContext context) {
    controller.addImagesList.clear();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.03),
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
                
                  
                  SizedBox(height: Get.height * 0.025),
                  
                  SizedBox(
                    width: Get.width * 0.9,
                    child: GetBuilder<BusinessProfileController>(
                    init: BusinessProfileController(),
                    builder: (value) {
                      return StaggeredGrid.count(
                        axisDirection: AxisDirection.down,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                         StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.3,
                              child: UpdateProfilePhotoTile(
                                index: 0,
                                controller: controller,
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.3,
                             child: UpdateProfilePhotoTile(
                              index: 1,
                              controller: controller,
                            ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.3,
                              child: UpdateProfilePhotoTile(
                                index: 3,
                                controller: controller,
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.3,
                             child: UpdateProfilePhotoTile(
                                index: 4,
                                controller: controller,
                              ),
                            ),
                          
                        ],
                      );
                    }),
                  ),
            
                  // Continuess button
                  SizedBox(height: Get.height * 0.03),
                  GestureDetector(
                    onTap: () {
                      if (controller.addImagesList.isEmpty) {
                        Constant.showSnackBar(
                            'Add Image', 'Please add at least one photo to continue');
                      } else {
                        var data = {
                          "userId": SessionController().user?.data?.sId ?? '',
                        };
                        controller.updateGalleryImage(SessionController().businessProfile?.data?.sId ?? '', data);
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
                              'Save changes',
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
      ),
    );
  }
}

// ignore: must_be_immutable
class UpdateProfilePhotoTile extends StatelessWidget {
  UpdateProfilePhotoTile(
      {Key? key,
      this.index,
      this.margin = 0,
      this.controller,
      this.imageGallery})
      : super(key: key);

  final int? index;
  final double? margin;
  final BusinessProfileController? controller;
  Gallery? imageGallery;

  @override
  Widget build(BuildContext context) {
    return Obx(() => (InkWell(
        onTap: () async {
          try {
            debugPrint(controller!.gallery[index!]);
            controller!.imagePicked2(
                index: index,
                oldImagelink: controller!.gallery[index!] != null
                    ? controller!.gallery[index!]!
                    : null
            );
          } catch (e) {
            controller!.imagePicked2(index: index, oldImagelink: null);
          }
        },
        child: controller!.addImagesList.containsKey(index)
            ? Container(
                margin: EdgeInsets.only(bottom: margin!),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(controller!.addImagesList[index]!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : controller!.gallery.length - 1 >= index!
                ? Container(
                    margin: EdgeInsets.only(bottom: margin!),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              controller!.gallery[index!],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              right: 15,
                              top: 10,
                              child: InkWell(
                                onTap: () {
                                  controller!.showDeleteDialog(context,
                                      controller!.gallery[index!].sId!);
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: 25,
                                  color: AppTextTheme.colorF8F37E,
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                : !controller!.addImagesList.containsKey(index)
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppTextTheme.color828898,
                        radius: const Radius.circular(20),
                        dashPattern: const [5,5],
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: AppTextTheme.color828898,
                            size: 30,
                          ),
                        ),
                      )
                    : const SizedBox())));
  }
}


class Gallery {
  String? image;
  String? sId;

  Gallery({image, sId});

  Gallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['_id'] = sId;
    return data;
  }
}