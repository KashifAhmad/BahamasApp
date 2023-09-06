import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/auth_controller.dart';
import 'package:bahamas/main_authentication/create_screen1.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController authController = Get.put(AuthController());

  bool isPasswordShow = false;

  @override
  void initState() {
    super.initState();
    authController.loginEmailController.text = '';
    authController.loginPasswordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.08),
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
                    'Login you account',
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
                    'Enter your account details to continue.',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    )
                  ),
                ),
              
                // social media signin
                SizedBox(height: Get.height * 0.05),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Row(
                    children: [
                      // google buttom
                      GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: Get.height * 0.07,
                                width: Get.width * 0.44,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppTextTheme.colorABB2C4
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                       child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: Get.width * 0.02),
                                        child: Image.asset(
                                          'assets/icons/google_icon.png',
                                          height: 25,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.04),
                                      Text(
                                        'Google',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesMedium,
                                          color: AppTextTheme.color181818
                                        )
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      
                      const Spacer(),
                      //facebook buttom
                      GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: Get.height * 0.07,
                                width: Get.width * 0.44,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppTextTheme.colorABB2C4
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                       child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: Get.width * 0.02),
                                        child: Image.asset(
                                          'assets/icons/fb_icon.png',
                                          height: 25,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.02),
                                      Text(
                                        'Facebook',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesMedium,
                                          color: AppTextTheme.color181818
                                        )
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                SizedBox(
                            width: Get.width * 0.9,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 1,
                                  width: Get.width * 0.23,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.colorABB2C4,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Continue with email',
                                   style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.colorABB2C4
                                  )
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 1,
                                  width: Get.width * 0.23,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.colorABB2C4,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  SizedBox(height: Get.height * 0.03),
                  Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: authController.loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'Enter email',
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.colorABB2C4
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
                  Center(
                     child: SizedBox(
                      width: Get.width * 0.9,
                          child: TextFormField(
                            controller: authController.loginPasswordController,
                            obscureText: isPasswordShow ? false : true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18.0),
                              labelText: 'Enter password',
                              suffix: GestureDetector(
                                onTap: () {
                                  setState((){
                                    isPasswordShow = !isPasswordShow;
                                  });
                                },
                                child: Text(
                                  isPasswordShow ? 'Hide' : 'Show',
                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898
                                  ),
                                )
                              ),
                              // add here
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898
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
          
                // Login button
                SizedBox(height: Get.height * 0.02),
                GestureDetector(
                            onTap: () {
                              var data = {
                                'email': authController.loginEmailController.text.trim().toString(),
                                'password': authController.loginPasswordController.text.trim().toString(),
                              };
                              if(authController.loginEmailController.text.isEmpty || authController.loginPasswordController.text.isEmpty) {
                                Constant.showSnackBar(
                                  'Failed',
                                  'Please enter email and password'
                                );
                              }
                              else {
                                if(authController.loginEmailController.text.toString().isNotEmpty) {
                                  final bool isValid = EmailValidator.validate(authController.loginEmailController.text.toString());
                                  if(isValid == false) {
                                    Constant.showSnackBar('Invalid Email', 'Please enter valid email address.');
                                  } else {
                                    authController.signInWithEmail(data, context);
                                  }
                                } 
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
                                    'Login',
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
                SizedBox(
                            width: Get.width * 0.9,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 1,
                                  width: Get.width * 0.3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.colorABB2C4,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'New here ?',
                                   style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.colorABB2C4
    
                                    )
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 1,
                                  width: Get.width * 0.3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.colorABB2C4,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                // Create an account button
                SizedBox(height: Get.height * 0.03),
                GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Get.to(() => const CreateScreen());
                            },
                            child: SizedBox(
                              height: Get.height * 0.07,
                              width: Get.width * 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppTextTheme.colorABB2C4,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Text(
                                    'Create an account',
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
                          
              ],
            ),
          ),
        ),
      ),
    );
  }
}