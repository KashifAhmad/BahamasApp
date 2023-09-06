import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/auth_controller.dart';
import 'package:bahamas/main_authentication/login_account_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  AuthController authController = Get.find();
  RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  void initState() {
    super.initState();
    authController.nameController.text = '';
    authController.emailController.text = '';
    authController.phoneController.text = '';
    authController.passwordController.text = '';
    authController.confirmPasswordController.text = '';
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
            child: SingleChildScrollView(
              child: Obx(() =>
                 Column(
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
                      // login button
                      SizedBox(
                        height: Get.height * 0.05,
                        width: Get.width * 0.2,
                        child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                  Get.to(() => const LoginScreen());
                                  authController.nameController.clear();
                                  authController.emailController.clear();
                                  authController.phoneController.clear();
                                  authController.passwordController.clear();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppTextTheme.colorABB2C4,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0)
                                ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesMedium,
                                          color: AppTextTheme.color828898,
                                        )
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Text(
                        'Create an account',
                        style: AppTextTheme.lightTextTheme.displayLarge!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesDemiBold,
                          color: AppTextTheme.color2D2D33,
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
                                          color: AppTextTheme.colorABB2C4,
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
                                              color: AppTextTheme.color181818,
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
                                          color: AppTextTheme.colorABB2C4,
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
                                              color: AppTextTheme.color181818,
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
                                        color: AppTextTheme.colorABB2C4,
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
                      
                      // Full name textfield
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextField(
                                controller: authController.nameController,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Enter full name',
                                  // hintText: widget.user.name,
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
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
                      
                      // Email textfield
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextField(
                                controller: authController.emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Enter email',
                                  // hintText: widget.user.name,
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
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
                      
                      // Phone number textfield
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextField(
                                controller: authController.phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Phone number',
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
                                  ),
                                  prefixIcon: CountryCodePicker(
                                    onChanged: (element) {
                                     debugPrint('selected ${element.dialCode}');
                                     authController.countryCode.value = element.dialCode.toString();
                                    },
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: '+1', 
                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33,
                                  ),
                                    showFlag: false,
                  
                                    //showFlagDialog: true,
                                    //comparator: (a, b) => b.name.compareTo(a.name),
                                    //Get the country information relevant to the initial selection
                                    // onInit: (code) => print("${code.name} ${code.dialCode}"),
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
                      
                      // Password textfield,
                      SizedBox(height: Get.height * 0.03),
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextFormField(
                                controller: authController.passwordController,
                                obscureText: authController.isPasswordShow.value ? false : true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Choose password',
                                  suffix: GestureDetector(
                                    onTap: () {
                                        authController.isPasswordShow.value = !authController.isPasswordShow.value;
                                    },
                                    child: Text(
                                      authController.isPasswordShow.value ? 'Hide' : 'Show'
                                    )
                                  ),
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
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
                       // Confirm Password textfield,
                      SizedBox(height: Get.height * 0.03),
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.9,
                              child: TextFormField(
                                controller: authController.confirmPasswordController,
                                obscureText: authController.isConfirmPasswordShow.value ? false : true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: 'Confirm password',
                                  suffix: GestureDetector(
                                    onTap: () {
                                        authController.isConfirmPasswordShow.value = !authController.isConfirmPasswordShow.value;
                                    },
                                    child: Text(
                                      authController.isConfirmPasswordShow.value ? 'Hide' : 'Show'
                                    )
                                  ),
                                  // add here
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
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
                    SizedBox(height: Get.height * 0.03),
                    GestureDetector(
                                onTap: () {
                                  debugPrint(authController.accountType.value.toString());
                                  var data = {
                                    'fullName': authController.nameController.text.toString().trim(),
                                    'email': authController.emailController.text.toString().trim(),
                                    'countryCode': authController.countryCode.value.toString().isEmpty ? '+1' : authController.countryCode.value.toString(),
                                    'phone': authController.phoneController.text.toString().trim(),
                                    'profileType': authController.accountType.value.toString(),
                                    'password': authController.passwordController.text.toString().trim(),
                                    'confirmPassword': authController.confirmPasswordController.text.toString().trim(),
                                  };
                                  FocusScope.of(context).unfocus();
                                  if(authController.nameController.text.isEmpty) {
                                    Constant.showSnackBar(
                                      'Wait',
                                     'Please enter name'
                                    );
                                  } else if(authController.emailController.text.isEmpty) {
                                    Constant.showSnackBar(
                                      'Wait',
                                     'Please enter email'
                                    );
                                  } else if(authController.phoneController.text.isEmpty) {
                                    Constant.showSnackBar(
                                      'Wait',
                                     'Please enter phone number'
                                    );
                                  } else if(authController.passwordController.text.isEmpty) {
                                    Constant.showSnackBar(
                                      'Wait',
                                     'Please enter password'
                                    );
                                  } else if(!regExp.hasMatch(authController.passwordController.text)) {
                                     Constant.showSnackBar(
                                        'Wait',
                                        'Passwords must be 8 characters longs and must contain one upper case, one lower case alphabets, one digit and one special character.'
                                      );
                                  } else if(!regExp.hasMatch(authController.confirmPasswordController.text)) {
                                     Constant.showSnackBar(
                                      'Wait',
                                     'Passwords must be 8 characters longs and must contain one upper case, one lower case alphabets, one digit and one special character.'
                                    );
                                  } else if(authController.passwordController.text != authController.confirmPasswordController.text) {
                                     Constant.showSnackBar(
                                        'Wait',
                                        'Passwords do not match'
                                      );
                                  } else {
                                      if(authController.emailController.text.toString().isNotEmpty) {
                                        final bool isValid = EmailValidator.validate(authController.emailController.text.toString());
                                        if(isValid == false) {
                                          Constant.showSnackBar('Invalid Email', 'Please enter valid email address.');
                                        } else {
                                          authController.signUpWithEmail(data, context);
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
                                        'Create account',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesMedium,
                                          color: AppTextTheme.color2D2D33,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                    SizedBox(height: Get.height * 0.03),  
                    SizedBox(
                      width: Get.width * 0.9,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'By creating account you agree with the ',
                              style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898,
                              ),
                          ),
                          TextSpan(
                              text: 'terms & condition',
                              style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33,
                              ),
                          ),
                          TextSpan(
                              text: ' and ',
                              style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898,
                              ),
                          ),
                          TextSpan(
                              text: 'privacy policies',
                               style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33,
                              ),
                          ),
                          TextSpan(
                              text: ' of the app ',
                              style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color828898,
                              ),
                          ),
                        ]),
                      ),  
                    ),
                    SizedBox(height: Get.height * 0.03),  
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