import 'package:bahamas/Business_side/create_business_profile/businesss_profile_step1_screen.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameOnController = TextEditingController();
  TextEditingController ccvController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cardNumberController.clear();
    nameOnController.clear();
    ccvController.clear();
    expireDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
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
                    'Payment method',
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
                    'Add credit/debit card to buy subscriptions',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    )
                  ),
                ),
            
                SizedBox(height: Get.height * 0.05),
                // card number textfield
                Center(
                   child: SizedBox(
                    width: Get.width * 0.9,
                        child: TextField(
                          controller: cardNumberController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18.0),
                            labelText: 'Card number',
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
                        child: TextField(
                          controller: cardNumberController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18.0),
                            labelText: "Name on card",
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
          
                // expire date and cvv Textfield
                SizedBox(
                  width: Get.width * 0.9,
                  child: Row(
                    children: [
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.43,
                              child: TextField(
                                controller: cardNumberController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: "Expiry date",
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
                                  filled: true,
                                  hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33.withOpacity(0.30),
                                  ),
                                  hintText: "mm/yy",         
                                  fillColor: Colors.white  
                                ),
                              )
                          ),
                      ),
                      const Spacer(),
                      Center(
                         child: SizedBox(
                          width: Get.width * 0.43,
                              child: TextField(
                                controller: cardNumberController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18.0),
                                  labelText: "CVV",
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
                    ],
                  ),
                ),
                // Add card button
                SizedBox(height: Get.height * 0.03),
                GestureDetector(
                            onTap: () {
                              Get.to(() => const BusinessProfileStep1());
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
                                    'Add Card',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}