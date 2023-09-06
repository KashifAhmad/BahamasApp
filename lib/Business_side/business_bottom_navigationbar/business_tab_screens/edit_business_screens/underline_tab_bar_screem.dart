import 'package:bahamas/Business_side/business_bottom_navigationbar/business_tab_screens/edit_business_screens/edit_business_gallery_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/business_tab_screens/edit_business_screens/edit_business_profile_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/business_tab_screens/edit_business_screens/edit_socials_accont_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnderlineTabBarMainScreen extends StatefulWidget {
  const UnderlineTabBarMainScreen({super.key});

  @override
  State<UnderlineTabBarMainScreen> createState() => _UnderlineTabBarMainScreenState();
}

class _UnderlineTabBarMainScreenState extends State<UnderlineTabBarMainScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Builder(
          builder: (BuildContext context) {
            // int index = DefaultTabController.of(context).index;
            
            
            return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                index == 0
                ?
                'Edit details'
                : 
                index == 1
                ?
                'Edit photos'
                : 
                'Edit socials',
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                  decoration: TextDecoration.none,
                  fontFamily: AppTextTheme.ttHovesMedium,
                  color: AppTextTheme.color2D2D33,
                )
              ),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    Constant.backArrowIcon,
                    height: 24,
                  ),
                ),
              ),
              
              bottom: PreferredSize(
                preferredSize: Size(Get.width * 0.6, 70.0),
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  unselectedLabelColor: AppTextTheme.color2D2D33.withOpacity(0.50),
                  unselectedLabelStyle: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                        fontFamily: AppTextTheme.ttHovesMedium,
                  ),
                  labelStyle: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                        fontFamily: AppTextTheme.ttHovesMedium,
                  ),
                  labelColor: AppTextTheme.color2D2D33,
                  indicatorColor: AppTextTheme.colorF8D20F,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1,
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.only(bottom: 15),
                  tabs: const [
                    Text(
                      'About',
                    ),
                    Text(
                      'Gallery',
                    ),
                     Text(
                      'Socials',
                    ),
                  ],
                ),
              ),
            ),
            body:  const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                EditBusinessProfileScreen(),
                EditGalleryScreen(),
                EditSocialAccountsScreen(),
              ],
            ),
          );
          }
        ),
      ),
    );
  }
}