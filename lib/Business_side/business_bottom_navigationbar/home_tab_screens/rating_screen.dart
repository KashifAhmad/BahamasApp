import 'package:bahamas/Business_side/business_bottom_navigationbar/business_bottombar.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reviewController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Rate - Grand Bahama Island',
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
                  'Tell your experience about the business to help other users.',
                  style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                    decoration: TextDecoration.none,
                    fontFamily: AppTextTheme.ttHovesMedium,
                    color: AppTextTheme.color2D2D33.withOpacity(0.50)
                  )
                ),
              ),
          
              SizedBox(height: Get.height * 0.05),
              Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.12,
                      decoration: BoxDecoration(
                        color: AppTextTheme.colorFFFBE9,
                        border: Border.all(
                          width: 1,
                          color: AppTextTheme.colorF9EFC0,
                        ),
                        borderRadius: BorderRadius.circular(9.0)
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 3.0),
                                      child: Image.asset(
                                        Constant.whitestarIcon,
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                  );
                                }
                              )
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                             ),
              
              const SizedBox(height: 20),

              // multi Texformtfield
              Center(
                child: SizedBox(
                  width: Get.width * 0.9,
                  child: TextFormField(
                    controller: reviewController,
                    maxLines: 7,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18.0),
                    labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color828898,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTextTheme.colorF9EFC0, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTextTheme.colorF9EFC0, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTextTheme.colorF9EFC0, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ), 
                    filled: true,
                    hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color828898,
                    ),
                    hintText: "Write your experince",
                    fillColor: AppTextTheme.colorFFFDF5
                    ),
                  )
                ),
              ),
               
              // submit rating button
              SizedBox(height: Get.height * 0.03),
              GestureDetector(
                onTap: () {
                   Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(builder: (BuildContext context) => const BusinessBottomNavigationBar()),
                    ModalRoute.withName('/'),
                  );
                }
                ,
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
                      'Submit rating',
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
    );
  }
}