import 'package:bahamas/data/controller/auth_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    authController.codeController.clear();
    // popup with code when screen open
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await showDialog<String>(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //           title:  Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "Verification code",
    //                 style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
    //                   decoration: TextDecoration.none,
    //                   fontFamily: AppTextTheme.ttHovesDemiBold,
    //                   color: AppTextTheme.color2D2D33
    //                 )
    //               ),
    //             ],
    //           ),
    //           content:  Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 SessionController().user!.data?.recaptcha ?? '',
    //                 style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
    //                   decoration: TextDecoration.none,
    //                   fontFamily: AppTextTheme.ttHovesMedium,
    //                   color: AppTextTheme.color2D2D33
    //                 )
    //               ),
    //             ],
    //           ),
    //           actions: <Widget>[
    //              InkWell(
    //               onTap: () => Get.back(),
    //                child: Center(
    //                  child: Text(
    //                   "OK",
    //                   style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
    //                     decoration: TextDecoration.none,
    //                     fontFamily: AppTextTheme.ttHovesDemiBold,
    //                     color: AppTextTheme.color2D2D33
    //                   )
    //                                ),
    //                ),
    //              ),
    //           ],
    //         ),
    //   );
    // });
  
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.02),
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
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Text(
                    'Verify account',
                    style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesDemiBold,
                      color: AppTextTheme.color2D2D33
                    )
                  ),
                ),
                
                SizedBox(height: Get.height * 0.015),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Text(
                    'An OTP is sent on provided email & number, enter code to verify',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    )
                  ),
                ),
            
                // Verify code screen Textfield
                SizedBox(height: Get.height * 0.05),
                   Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: authController.codeController,
                            keyboardType: TextInputType.phone,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'Enter verification code',
                              suffixText: 'Resend',
                              hintText: '-  -  -  -  -  -  -',
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 107, 106, 144),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromRGBO(171, 178, 196, 1), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromRGBO(45, 45, 51, 1), width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),  
                            ),
                          )
                      ),
                   ),
        
                // Verify button
                SizedBox(height: Get.height * 0.03),
                GestureDetector(
                            onTap: () {
                              authController.verifyCodeApi(
                                authController.emailController.text.trim().toString(),
                                //  SessionController().user?.data?.sId ?? '',
                                 authController.codeController.text.trim().toString(), 
                                 context
                              );
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
                                    'Verify account',
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
                Text(
                  'Resend code in',
                  style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesRegular,
                      color: AppTextTheme.color2D2D33,
                       shadows: [
                        Shadow(
                          blurRadius:4.0,  // shadow blur
                          color: AppTextTheme.black.withOpacity(0.25), // shadow color
                          offset: const Offset(0.0, 4.0), // how much shadow will be shown
                        ),
                      ],
                  )
                ),        
              ],
            ),
          ),
        ),
      ),
    );
  }
}