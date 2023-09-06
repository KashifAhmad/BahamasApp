import 'package:bahamas/Business_side/business_bottom_navigationbar/business_bottombar.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/onboarding/onboarding_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    super.initState();
    // Future.delayed( const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => const OnboardingScreen()
    //     ));
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPreference();
      checkAuthentication();
    });
  }

  Future getPreference() async{
      await SessionController.getUserFromPreference();
      await SessionController.getBusinessProfileFromPreference();
      debugPrint('cheeeck profile type...');
      debugPrint(SessionController().user?.data?.profileType.toString());
  }
  
  //check for auth
  void checkAuthentication() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var flag = prefs.getBool('isLogin');

      if (kDebugMode) {
        print('Flag $flag');
      }
      if (flag != true) {
       await Future.delayed(const Duration(seconds: 2));
       Get.offAll(() => const OnboardingScreen());

      } else {
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => const BusinessBottomNavigationBar());

      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash_bg.png',
            )
          )
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
           Image.asset(
            'assets/logo/splash_logo.png',
            height: 150,
            width: 150,
          ),
          const Spacer(),
          Text(
            'Archipelago',
            style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
              decoration: TextDecoration.none,
              fontFamily: AppTextTheme.ttHovesDemiBold,
              color: AppTextTheme.black
            )
          ),
          const SizedBox(height: 30),
        ],
      )
    );
  }
}