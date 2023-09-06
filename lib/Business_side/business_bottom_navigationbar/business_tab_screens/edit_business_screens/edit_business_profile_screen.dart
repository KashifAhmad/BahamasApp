import 'package:bahamas/Business_side/create_business_profile/about_business_step1_screen.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBusinessProfileScreen extends StatefulWidget {
  const EditBusinessProfileScreen({super.key});

  @override
  State<EditBusinessProfileScreen> createState() => _EditBusinessProfileScreenState();
}

class _EditBusinessProfileScreenState extends State<EditBusinessProfileScreen> {

  BusinessProfileController controller = Get.find();

  dynamic categoryDropDownValue;
  String? subCategoryDropDownValue;
  String? islandDropDownValue;

  @override
  void initState() {
    super.initState();
    controller.businessNameController.text = SessionController().businessProfile?.data?.name ?? '';
    controller.businessAddressController.text = SessionController().businessProfile?.data?.address ?? '';
    controller.phoneController.text = SessionController().businessProfile?.data?.contact ?? '';
    controller.aboutBusinessController.text = SessionController().businessProfile?.data?.aboutBusiness ?? '';
    getDropdownValues();
  }

  getDropdownValues() async{
    await controller.categoriesInfo();
    await controller.islandInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.05),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    child: TextFormField(
                      controller: controller.businessNameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(18.0),
                        labelText: 'Business name',
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
                 SizedBox(
                    width: Get.width * 0.9,
                    child: DropdownButtonFormField(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                          labelText: 'Business category',
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
                          hintText: "Select category",
                          fillColor: Colors.white
                        ),
                        value: categoryDropDownValue,
                        onChanged: (value) async{
                          setState(() {
                            categoryDropDownValue = value; 
                            debugPrint('categories drop down value: $categoryDropDownValue');
                          });
                          controller.categoryDropDownId.value = value.toString();
                          debugPrint('categories id: ${controller.categoryDropDownId.value}');
                          await controller.subCategoriesInfo(categoryDropDownValue.toString());
                        },
                        items: controller.categoriesList
                            .map((categoryItem) => DropdownMenuItem(
                                value: categoryItem,
                                child: Text(
                                  categoryItem.name.toString()
                                )
                              )
                            ).toList(),
                      ),
                  ),
                
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  width: Get.width * 0.9,
                  child: DropdownButtonFormField(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      decoration: InputDecoration(
                        labelText: 'Sub category',
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
                        hintText: "Select sub category",
                        fillColor: Colors.white
                      ),
                      value: subCategoryDropDownValue,
                      onChanged: (value) {
                        setState(() {
                          subCategoryDropDownValue = value;
                          debugPrint('sub categories drop down value: ${controller.subCategoryDropDownId.value}');
                        });
                        controller.subCategoryDropDownId.value = value.toString();
                        debugPrint('sub categories id: ${controller.subCategoryDropDownId.value}');
                      },
                      items: controller.subCategoriesList
                          .map((subCategoryItem) => DropdownMenuItem(
                              value: subCategoryItem.id.toString(),
                              child: Text(subCategoryItem.name.toString())
                            )
                          )
                          .toList(),
                    ),
                ),
                
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  width: Get.width * 0.9,
                  child: DropdownButtonFormField(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      decoration: InputDecoration(
                        labelText: 'Select Island',
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
                        hintText: "Select Island",
                        fillColor: Colors.white),
                      value: islandDropDownValue,
                      onChanged: (value) {
                        setState(() {
                          islandDropDownValue = value;
                          debugPrint('island drop down value: $islandDropDownValue');
                        });
                        controller.islandDropDownId.value = value.toString();
                        debugPrint('island id: ${controller.islandDropDownId.value}');
                      },
                      items: controller.islandList.map(
                        (islandItem) => DropdownMenuItem(
                            value: islandItem.id.toString(),
                            child: Text(islandItem.name.toString())
                          )
                        ).toList(),
                    ),
                ),
                
                SizedBox(height: Get.height * 0.03),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    child: TextFormField(
                      controller: controller.businessAddressController,
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
                              controller: controller.phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(18.0),
                                labelText: 'Business contact number',
                                // add here
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelStyle: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color828898,
                                ),
                                prefixIcon: CountryCodePicker(
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
                                  //onInit: (code) => print("${code.name} ${code.dialCode}"),
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
                    // multi Texformtfield
                    Center(
                      child: SizedBox(
                        width: Get.width * 0.9,
                        child: TextFormField(
                          controller: controller.aboutBusinessController,
                          maxLines: 7,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18.0),
                            labelText: 'About business',
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
                            filled: true,
                          hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesMedium,
                            color: AppTextTheme.color2D2D33.withOpacity(0.30),
                          ),
                          hintText: "Tell us about your business",
                          fillColor: Colors.white  
                          ),
                        )
                      ),
                    ),
                // Continue button
                SizedBox(height: Get.height * 0.04),
                GestureDetector(
                            onTap: () {
                               FocusScope.of(context).unfocus();
                              Get.to(() => const AboutBusinessProfileStep1());
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
                                    'Save changes',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}