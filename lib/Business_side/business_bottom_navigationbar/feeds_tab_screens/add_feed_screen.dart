import 'package:bahamas/theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFeedsScreen extends StatefulWidget {
  const AddFeedsScreen({super.key});

  @override
  State<AddFeedsScreen> createState() => _AddFeedsScreenState();
}

class _AddFeedsScreenState extends State<AddFeedsScreen> {

  TextEditingController aboutBusinessController = TextEditingController();

  String? dropDownValue;
  String? dropDownValue1;
  List<String> cityList = [
    'Ajman',
    'Al Ain',
    'Dubai',
    'Fujairah',
    'Ras Al Khaimah',
    'Sharjah',
    'Umm Al Quwain'
  ];

   List<String> dayslist = [
    '1 day',
    '2 days',
    '3 days',
    '4 days',
    '5 days',
  ];

  @override
  void initState() {
    super.initState();
    aboutBusinessController.clear();
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
                      'Create feed',
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
                      'Post feed regularly so people can reach you out more offenly.',
                      style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.none,
                        fontFamily: AppTextTheme.ttHovesMedium,
                        color: AppTextTheme.color2D2D33.withOpacity(0.50)
                      )
                    ),
                  ),
              
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: GridView.count(
                        crossAxisCount: 2,  
                        physics:const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: Get.width * 0.05,  
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        childAspectRatio: (1 / 1.3),
                        children: List.generate(2, (index) {  
                          return DottedBorder(
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
                          );  
                        }  
                      )  
                    ),
                  ),  
                  SizedBox(height: Get.height * 0.03),
                  // multi Texformtfield
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: TextFormField(
                        controller: aboutBusinessController,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          labelText: 'Write a caption',
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
                  
                  // Select business
                  SizedBox(height: Get.height * 0.03),
                  
                  SizedBox(
                    width: Get.width * 0.9,
                    child: DropdownButtonFormField(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                          labelText: 'Select business',
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
                            filled: true,
                          hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33.withOpacity(0.30),
                          ),
                          hintText: "Select business",
                          fillColor: Colors.white
                        ),
                        value: dropDownValue,
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value;
                          });
                        },
                        items: cityList
                            .map((cityTitle) => DropdownMenuItem(
                                value: cityTitle, child: Text(cityTitle)))
                            .toList(),
                      ),
                  ),
                  
                  // Select business
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: DropdownButtonFormField(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                          labelText: 'Feed discovery',
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
                            filled: true,
                          hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33.withOpacity(0.30),
                          ),
                          hintText: "Select days",
                          fillColor: Colors.white
                        ),
                        value: dropDownValue1,
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue1 = value;
                          });
                        },
                        items: dayslist
                            .map((dayslist) => DropdownMenuItem(
                                value: dayslist, child: Text(dayslist)))
                            .toList(),
                      ),
                  ),
                  
                  // Verify button
                  SizedBox(height: Get.height * 0.04),
                  GestureDetector(
                              onTap: () {
                                Get.back();
                              //    Navigator.pushAndRemoveUntil<void>(
                              //     context,
                              //     MaterialPageRoute<void>(builder: (BuildContext context) => const BusinessFeedsTabScreen()),
                              //     ModalRoute.withName('/'),
                              //   );
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
                                      'Create Feed',
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
      ),
    );
  }
}