import 'dart:io';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddProfilePhotoTile extends StatelessWidget {
  AddProfilePhotoTile(
      {Key? key, this.index, this.margin = 0, this.controller})
      : super(key: key);

  final int? index;
  final double? margin;
  BusinessProfileController? controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        controller!.imagePicked(singleImage: false, index: index);
      },
      child: !controller!.addImagesList.containsKey(index)
          ? 
          DottedBorder(
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
          : 
          Container(
            margin: EdgeInsets.only(bottom: margin!),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(controller!.addImagesList[index]!.path),
                fit: BoxFit.cover,
              ),
            ),
          )
        );
  }
}
