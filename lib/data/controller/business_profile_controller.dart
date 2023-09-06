import 'dart:io';
import 'package:bahamas/Business_side/subscription/subscription_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/apis/apis.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/repositories/business_profile_repository.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessProfileController extends GetxController {

  // Business profile step 1 textfield
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // About business textfield
  TextEditingController aboutBusinessController = TextEditingController();

  // Add socials textfields
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  RxString searchTextVal = ''.obs;

  // Business profile step 1 dropdown values
  RxString categoryDropDownId = ''.obs;
  RxString subCategoryDropDownId = ''.obs;
  RxString islandDropDownId = ''.obs;

   // Business profile step1 update
  RxString businessName = ''.obs;
  RxString businessLocation = ''.obs;
  RxString aboutBusiness = ''.obs;
  RxString businessNumber = ''.obs;
  RxString businessCategory = ''.obs;

  List<MyModel> categoriesList = [];
  List<MyModel> subCategoriesList = [];
  List<MyModel> islandList = [];

  // Gallary image list with index
  Map<int, XFile> addImagesList = {};
  List galleryList = [];
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();

  // Update gallery
  RxList gallery = [].obs;
  XFile? imageFile2;
  final ImagePicker _picker2 = ImagePicker();

   @override
  void dispose() {
    super.dispose();
    businessNameController.dispose();
    aboutBusinessController.dispose();
    businessAddressController.dispose();
    phoneController.dispose();
  }

  // Get categories info
  Future<void> categoriesInfo() async {
    categoriesList.clear();
    var response = await BusinessProfileRepository().getAllCategoriesApi();
    for (int i = 0; i < response.data!.length; i++) {
      categoriesList.add(MyModel(id: response.data![i].sId , name: response.data![i].category));
    }
  }

  // Get subCategories info
  Future<void> subCategoriesInfo(String categoryId) async {
    subCategoriesList.clear();
    var response = await BusinessProfileRepository().getSubCategoriesApi(categoryId);
    for (int i = 0; i < response.data!.length; i++) {
      subCategoriesList.add(MyModel(id: response.data![i].sId , name: response.data![i].subCategory));
    }
  }

  // Get island info
  Future<void> islandInfo() async {
    islandList.clear();
    var response = await BusinessProfileRepository().getAllIslandsApi();
    for (int i = 0; i < response.data!.length; i++) {
      islandList.add(MyModel(id: response.data![i].sId , name: response.data![i].island));
    }
  }

  // Create business profile api
  Future createBusinessProfile() async {
    Constant.showDialog();
    dynamic response;
    dynamic data = {
        "name": businessNameController.text.toString(),
        "categoryId": categoryDropDownId.value.toString(),
        "subCategoryId": subCategoryDropDownId.value.toString(),
        "userId": SessionController().user!.data!.sId.toString(),
        "islandId": islandDropDownId.value.toString(),
        "address": businessAddressController.text.toString(),
        "contact": phoneController.text.toString(),
        "longitude": SessionController().lat.toString(),
        "latitude": SessionController().lon.toString(),
        "aboutBusiness": aboutBusinessController.text.toString(),
        "facebook": facebookController.text.toString(),
        "instagram": instagramController.text.toString(),
        "twitter": twitterController.text.toString(),
        "whatsapp": whatsappController.text.toString(),
        "website": websiteUrlController.text.toString(),
    };
    List<File> imageList = getGalleryImagePath();
      
    // if (imageFile != null) {
      debugPrint('inside if condition');
      debugPrint('image list paths: ${imageList.toString()}');
      debugPrint('image list length: ${imageList.length.toString()}');
      response = await NetworkApiService().postMultipleMultipart(Apis.addBusinessprofileApi, imageList, data);
      debugPrint('response of if condition');
    // } else {
    //   debugPrint('inside else condition');
    //   response = await NetworkApiService()
    //     .po(
    //       Apis.addBusinessprofileApi,
    //       userId,
    //       data
    //     );
    //   debugPrint('response of else condition');
    // }

    debugPrint(response.toString());
    Get.back();
    if(response['status'] == 200) {
      if (response['success'] == true) {
        Get.back();
        await SessionController.saveBusinessProfileInPreference(response);
        await SessionController.getBusinessProfileFromPreference();
        Get.to(() => const SubscriptionScreen());
        Constant.showSnackBar('Successfully', 'Business profile created successfully');
      } else {
        Get.back();
        Constant.showSnackBar('Error', response);
      }
    } else {
      Get.back();
      if(response['message'].toString().contains('Dup (name, address, contact, website) not Allowed!')) {
        Constant.showSnackBar('Duplication Error!', 'Duplicate (name, address, contact, website) not Allowed!');
      } else {
        Constant.showSnackBar('Error', response);
      }
    }
  } // end create business

  // Edit profile api
  Future editBusinessProfileStep1(String businessId, Map data) async {
    Constant.showDialog();
    dynamic response;
    response = await NetworkApiService().putApiResponse(Apis.updateBusinessProfileApi, businessId, data);

    debugPrint(response.toString());
    Get.back();
    if (response['success'] == true) {
      businessName.value = response['data']['name'].toString();
      debugPrint(businessName.value.toString());
      aboutBusiness.value = response['data']['bioData'].toString();
      debugPrint(businessName.value.toString());
      businessLocation.value = response['data']['bioData'].toString();
      debugPrint(businessLocation.value.toString());
      businessNumber.value = response['data']['bioData'].toString();
      debugPrint(businessNumber.value.toString());
      businessCategory.value = response['data']['bioData'].toString();
      debugPrint(businessCategory.value.toString());
      SessionController.saveBusinessProfileInPreference(response);
      SessionController.getBusinessProfileFromPreference();
      Get.back();
      Constant.showSnackBar('Successfully', 'Business profile updated successfully');
    } else {
      Constant.showSnackBar('Error', response);
    }
  }


  // Add gallery
   Future imagePicked({bool singleImage = true, int? index}) async {
    Constant.showDialog();
    imageFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (imageFile != null && !singleImage) {
      addImagesList[index!] = imageFile!;
    }
    update();
    Get.back();
  }

   // Get gallery image path
  List<File> getGalleryImagePath() {
    List<File> imageList = [];
      addImagesList.forEach((key, value) {
        imageList.add(File(value.path));
    });
    return imageList;
  }

  // ************************************* Update Gallery ******************************* //

  // Update gallery image
  Future updateGalleryImage( String businessId, var data) async {
    try {
      Constant.showDialog();
      List<File> imageList = [];
      addImagesList.forEach((key, value) {
        imageList.add(File(value.path));
      });
      await BusinessProfileRepository()
          .updateGalleryImage(businessId, imageList, data)
          .then((value) async {
            // gallery.value = SessionController().businessProfile?.data?.gallery ?? [];
        Get.back();
        Get.back();
        Constant.showSnackBar('Gallery updated successfully', '');
      });
    } catch (e) {
      debugPrint('Error while uplaoding gallery : $e');
      Get.back();
      Constant.showSnackBar('Failed to update gallery', '');
    }
  }
  
   // show image delete dailog
  showDeleteDialog(BuildContext context, String imageId) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Delete Image',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  // fontFamily: Constant.pangramBold,
                  color: Colors.black),
            ),
            content: Text('Do you want to delete this image from gallery?',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    // fontFamily: Constant.pangramRegular,
                    color: Colors.grey.shade600)),
            actions: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          // fontFamily: Constant.pangramRegular,
                          color: Colors.grey.shade700)),
                ),
              ),
              InkWell(
                onTap: () async {
                  // await deleteGalleryImage(imageId, "");
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Delete',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          // fontFamily: Constant.pangramRegular,
                          color: Colors.red)),
                ),
              )
            ],
          );
        });
  }

  Future imagePicked2({int? index, var oldImagelink}) async {
    try {
      imageFile2 = await _picker2.pickImage(
          source: ImageSource.gallery, imageQuality: 60);
      if (imageFile2 != null) {
        addImagesList[index!] = imageFile2!;
        if (oldImagelink != null) {
          // deleteGalleryImage(oldImagelink, "replace");
        }
      }
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // delete image Api called
  // deleteGalleryImage(String imageId, String condition) async {
  //   try {
  //     Constant.showDialog();
  //     var result = await NetworkApiService()
  //         .deleteApiRequest("${Apis.deleteGalleryUrl}$imageId");
  //     if (result['success']) {
  //       await SessionController.saveUserInPreference(result);
  //       await SessionController.getUserFromPreference();
  //       await getUserData();
  //       Get.back();
  //       if (condition == "replace") {
  //         Constant.showSnackBar('Image deleted successfully', '');
  //       }
  //     } else {
  //       Get.back();
  //       Constant.showSnackBar('Failed to delete Image', '');
  //     }
  //   } catch (e) {
  //     Get.back();
  //     debugPrint(e.toString());
  //     Constant.showSnackBar('Failed to delete Image', '');
  //   }
  // }


} 

class MyModel {
String? id, name ;
MyModel({this.id ,required this.name});
  factory MyModel.fromJson(dynamic json) {
    return MyModel(id: json['id'] as String, name: json['name'] as String);
}
@override
  String toString() {
    return '$name, $id';
  }
}