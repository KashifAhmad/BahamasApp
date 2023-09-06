import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  bool enabled;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onPressed;
  SearchField(
      {required Key? key,
      required this.controller,
      required this.onChanged,
      required this.enabled,
      required this.onPressed
      }
    ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.9,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18.0),
            labelText: 'Business address',
            // add here
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
              decoration: TextDecoration.none,
              fontFamily: AppTextTheme.ttHovesMedium,
              color: AppTextTheme.color828898,
            ),
            hintText: 'Search address',
            hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
              decoration: TextDecoration.none,
              fontFamily: AppTextTheme.ttHovesMedium,
              color: AppTextTheme.color2D2D33.withOpacity(0.40),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffix: Image.asset(
              Constant.gpsIcon,
              height: 20,
              width: 20,
            ),
          ),
          onChanged: onChanged,
        )
      ),
    );
                
  }
}