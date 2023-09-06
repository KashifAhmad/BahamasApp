import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/profile_controller.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  ProfileController profileController = Get.find();
  File? imageFile;
  String? imageLink;

  @override
  void initState() {
    super.initState();
    // if(SessionController().user.data!.email!.isNotEmpty) {
    //   SessionController().user.data!.phone!.split('')
    // }
    profileController.fullNameController.text = SessionController().user!.data!.fullName ?? '';
    profileController.emailController.text = SessionController().user!.data!.email ?? '';
    profileController.phoneNumberController.text = SessionController().user!.data!.phone ?? '';
    profileController.bioController.text = SessionController().user!.data!.bioData ?? '';
    imageLink = SessionController().user?.data?.image ?? '';
    debugPrint('ImageLink: ${SessionController().user?.data?.image.toString()}');
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
          child: SingleChildScrollView(
            child: Center(
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
                        'Edit profile',
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
                        'Edit/update your profile.',
                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesMedium,
                          color: AppTextTheme.color2D2D33.withOpacity(0.50)
                        )
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Row(
                        children: [
                          // Container(
                            // height: 100,
                            // width: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(16.0)
                          //   ),
                          //   child: Image.asset(
                          //     Constant.juliaImage,
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          Obx(() => profileController.imageFilePath.value != ""
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: InkWell(
                                onTap: () {
                                  debugPrint('tapppppped');
                                  getFromGallery();
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0)
                                  ),
                                  child: Image.file(
                                    File(profileController.imageFilePath.value),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : imageLink != null
                              ? InkWell(
                                  onTap: () {
                                    getFromGallery();
                                  },
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        imageLink!,
                                        fit: BoxFit.cover,
                                        height: 100,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Container(
                                            height: 100,
                                            width: 100,
                                            color: Colors.grey
                                                .withOpacity(0.3),
                                            child: SizedBox(
                                                height: Get.height * 0.24,
                                                child: const Center(
                                                    child: CircularProgressIndicator()
                                              )
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (context, child, loadingProgress) {
                                          return Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(16.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey)
                                                    ),
                                                child: Icon(
                                                  Icons.person_2_outlined,
                                                  color: Colors.grey.withOpacity(0.5),
                                                  size: 50,
                                                )
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox()),
                              
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () => getFromGallery(),
                              child: Text(
                                'Upload\nprofile picture',
                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color969699
                                )
                              ),
                            ),
                          )        
                        ],
                      ),
                    ),
                    // name textfield
                    const SizedBox(height: 40),
                    Center(
                       child: SizedBox(
                        width: Get.width * 0.9,
                            child: TextField(
                              controller: profileController.fullNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(18.0),
                                labelText: 'Enter full name',
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
          
                    // email textfield
                    SizedBox(height: Get.height * 0.03),
                    Center(
                       child: SizedBox(
                        width: Get.width * 0.9,
                            child: TextField(
                              controller: profileController.emailController,
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
                    
                    // phone Texformtfield
                    SizedBox(height: Get.height * 0.03),
                    Center(
                           child: SizedBox(
                            width: Get.width * 0.9,
                                child: TextField(
                                  controller: profileController.phoneNumberController,
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
          
                    // multi Texformtfield
                    SizedBox(height: Get.height * 0.03),
                    Center(
                      child: SizedBox(
                        width: Get.width * 0.9,
                        child: TextFormField(
                          controller: profileController.bioController,
                          maxLines: 7,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18.0),
                            labelText: 'Add bio',
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
                          hintText: "Enter your bio",
                          fillColor: Colors.white  
                          ),
                        )
                      ),
                    ),
                  
                    // Save changes button
                    SizedBox(height: Get.height * 0.03),
                    GestureDetector(
                                onTap: () {
                                   var data = {
                                      'fullName': profileController.fullNameController.text.toString().trim(),
                                      'email': profileController.emailController.text.toString().trim(),
                                      'phone': profileController.phoneNumberController.text.toString().trim(),
                                      'bioData': profileController.bioController.text.toString().trim(),
                                    };
                                    FocusScope.of(context).unfocus();
                                    if(profileController.fullNameController.text.isEmpty) {
                                      Constant.showSnackBar(
                                        'Wait',
                                       'Please enter name'
                                      );
                                    } else if(profileController.fullNameController.text.isEmpty) {
                                      Constant.showSnackBar(
                                        'Wait',
                                       'Please enter email'
                                      );
                                    } else if(profileController.phoneNumberController.text.isEmpty) {
                                      Constant.showSnackBar(
                                        'Wait',
                                       'Please enter phone number'
                                      );
                                    } else if(profileController.bioController.text.isEmpty) {
                                      Constant.showSnackBar(
                                        'Wait',
                                       'Please enter bio'
                                      );
                                    } else {
                                      profileController.editProfile(imageFile, SessionController().user?.data?.sId ?? '', data);
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
                                        'Save changes',
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
      ),
    );
  }

  // Get from gallery
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    imageFile = File(pickedFile!.path);
    if (imageFile != null) {
      profileController.imageFilePath.value = imageFile!.path;
    }
  }

}