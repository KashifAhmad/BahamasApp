import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  @override
  // ignore: overridden_fields
  final Key? key;
  final Widget actions;
  final Widget navBar;
  final String title;
  final Function()? onBackPressed;
  const CustomAppBar({
    this.actions = const SizedBox(width: 15),
    required this.navBar,
    required this.title,
    required this.onBackPressed,
    this.key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width * 0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'Add address',
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                    decoration: TextDecoration.none,
                    fontFamily: AppTextTheme.ttHovesMedium,
                    color: AppTextTheme.color2D2D33,
                  )
              ),
              const SizedBox(width: 30),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 25),
        navBar,
      ],
    );
  }
}