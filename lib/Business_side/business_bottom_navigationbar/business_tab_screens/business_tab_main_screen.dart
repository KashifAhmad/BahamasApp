import 'package:bahamas/Business_side/business_bottom_navigationbar/business_tab_screens/edit_business_screens/underline_tab_bar_screem.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/Utils/extensions.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/data/controller/saved_business_controller.dart';
import 'package:bahamas/data/models/get_specific_business_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BusinessTabMainScreen extends StatefulWidget {
  const BusinessTabMainScreen({super.key});

  @override
  State<BusinessTabMainScreen> createState() => _BusinessTabMainScreenState();
}

class _BusinessTabMainScreenState extends State<BusinessTabMainScreen> {

  PageController pageViewController = PageController();

  SavedBusinessController controller = Get.find();
  BusinessProfileController businessController = Get.put(BusinessProfileController());

  String? dropDownValue;
  String? dropDownValue1;
  List<String> verificationList = [
    'Veryfied',
    'Not verified',
  ];
  List<String> ratingList = [
    'All ratings',
    'Few ratings',
  ];

  @override
  void initState() {
    super.initState();
  }

  getPrefrenvce() {
    SessionController.getBusinessProfileFromPreference();
    var businessId = SessionController().businessProfile?.data?.sId ?? '';
    debugPrint('Business Id $businessId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Center(
         child: FutureBuilder<GetSpecificBusinessModel>(
            future: controller.getSpecificBusiness(SessionController().businessProfile?.data?.sId ?? ''),
            // future: controller.getSpecificBusiness('64e4b626cebd20c18eb9ffe3'),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Text('Loading');
              }else if(snapshot.hasData){
                if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                  return const Text(('No internet connect'));
                } 
                else if(snapshot.data?.data.toString() == 'null'){
                  return const SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(('No business detail')),
                      ],
                    ),
                  );
                }
                else {
                  return Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Stack(
                            children: [
                             SizedBox(
                            height: Get.height * 0.5,
                            child: PageView(
                              controller: pageViewController,
                              children: [
                                // SizedBox(
                                //   width: Get.width,
                                //   height: Get.height * 0.5,
                                //   child: Image.asset(
                                //     Constant.cabbageBeachFullSizeImage,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: Get.width,
                                //   height: Get.height * 0.5,
                                //   child: Image.asset(
                                //     Constant.cabbageBeachFullSizeImage,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: Get.width,
                                //   height: Get.height * 0.5,
                                //   child: Image.asset(
                                //     Constant.cabbageBeachFullSizeImage,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),  
                                businessController.gallery.isEmpty // when user update gallery then check gallery list has image or not
                                ?
                                  snapshot.data!.data!.gallery!.isEmpty // when user come without updating gallery
                                  ?
                                  Container(
                                    width: Get.width * 0.9,
                                    height: 200,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    // child: Image.asset(
                                    // Constant.cabbageBeaachImage,
                                    //   fit: BoxFit.fill,
                                    // ),
                                    child: Center(
                                      child: Text(
                                        'No image found',
                                        style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesRegular,
                                          color: AppTextTheme.color2D2D33
                                        ),
                                      ),
                                    ),
                                  )
                                  :
                                  SizedBox(
                                    width: Get.width * 0.9,
                                    height: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                                        snapshot.data?.data?.gallery!.first ?? '',
                                                        fit: BoxFit.cover,
                                                        width: Get.width * 0.9,
                                                        height: 200,  
                                                        loadingBuilder:
                                                            (context, child, loadingProgress) {
                                                          if (loadingProgress == null) {
                                                            return child;
                                                          }
                                                          return Container(
                                                            width: Get.width * 0.9,
                                                            height: 200,
                                                            color: Colors.grey.withOpacity(0.3),
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
                                                                width: Get.width * 0.9,
                                                                height: 200,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(16.0),
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
                                  )
                                
                                :
                                SizedBox(
                                    width: Get.width * 0.9,
                                    height: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                                        businessController.gallery.first  ?? '',
                                                        fit: BoxFit.cover,
                                                        width: Get.width * 0.9,
                                                        height: 200,  
                                                        loadingBuilder:
                                                            (context, child, loadingProgress) {
                                                          if (loadingProgress == null) {
                                                            return child;
                                                          }
                                                          return Container(
                                                            width: Get.width * 0.9,
                                                            height: 200,
                                                            color: Colors.grey.withOpacity(0.3),
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
                                                                width: Get.width * 0.9,
                                                                height: 200,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(16.0),
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
                                
                              ],
                            ),
                          ),
                            SafeArea(
                              child: Padding(
                                padding: EdgeInsets.only(top: Get.height * 0.03),
                                child: Center(
                                  child: SizedBox(
                                    width: Get.width * 0.9,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Business profile',
                                              style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
                                              decoration: TextDecoration.none,
                                                fontFamily: AppTextTheme.ttHovesDemiBold,
                                                color: snapshot.data!.data!.gallery!.isEmpty ?  AppTextTheme.black : AppTextTheme.white,
                                              )
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              width: 70,
                                              height: 34,
                                              decoration: BoxDecoration(
                                                color: AppTextTheme.colorFEF8DC,
                                                borderRadius: BorderRadius.circular(8.0)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Admin',
                                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                                  decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33,
                                                  )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => const UnderlineTabBarMainScreen());
                                          },
                                          child: Container(
                                            width: 120,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: AppTextTheme.colorABB2C4
                                              ),
                                              borderRadius: BorderRadius.circular(8.0)
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Edit Business',
                                                style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                                  fontFamily: AppTextTheme.ttHovesMedium,
                                                  color: snapshot.data!.data!.gallery!.isEmpty ?  AppTextTheme.black : AppTextTheme.white,
                                                )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                            ),
                          Image.asset(Constant.islandBottomImage),
                          // rating
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Center(
                              child: SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 78,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: AppTextTheme.colorFEF8DC,
                                        borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                          Constant.ratingStarIcon,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(width: Get.width * 0.025),
                                        Text(
                                          snapshot.data?.data?.averageRating.toString() ?? '',
                                          // '4.9',
                                          style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                          decoration: TextDecoration.none,
                                            fontFamily: AppTextTheme.ttHovesMedium,
                                            color: AppTextTheme.color2D2D33,
                                          )
                                        )
                                      ],
                                    )
                                    ),
                                  const Spacer(),
                                    Visibility(
                                      visible: businessController.gallery.isEmpty
                                               ? snapshot.data!.data!.gallery!.isEmpty ? false : true
                                               : businessController.gallery.isEmpty ? false : true,
                                      child: SmoothPageIndicator(
                                        controller: pageViewController,
                                        count: snapshot.data?.data?.gallery?.length ?? 0,
                                        effect: ExpandingDotsEffect(
                                          dotColor: AppTextTheme.color181818.withOpacity(0.20),
                                          activeDotColor: AppTextTheme.color181818,
                                          dotWidth: 8,
                                          dotHeight: 5,
                                          strokeWidth: 0
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ]
                      ),
                      SizedBox(height: Get.width * 0.02),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Obx(() =>
                                  Text(
                                    businessController.businessName.value == ''
                                    ?
                                    snapshot.data?.data?.name.toString() ?? ''
                                    :
                                    businessController.businessName.value.toString(),
                                    // 'Cabbage Beach',
                                    style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.color2D2D33,
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Text(
                                  snapshot.data?.data?.address.toString() ?? '',
                                  // 'One Casino Drive, Suite 42, New Providence, The Bahamas',
                                  style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color828898,
                                  )
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              SizedBox(
                                                width: Get.width * 0.9,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: AppTextTheme.colorF3F3F3,
                                                        borderRadius: BorderRadius.circular(8.0)
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                                                          child: Text(
                                                            snapshot.data?.data?.categoryId?.category.toString() ?? '',
                                                            // 'Restaurant',
                                                            style: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
                                                              decoration: TextDecoration.none,
                                                              fontFamily: AppTextTheme.ttHovesMedium,
                                                              color: AppTextTheme.color2D2D33,
                                                            )
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 15),
                                                    // Container(
                                                    //   decoration: BoxDecoration(
                                                    //     color: AppTextTheme.colorF3F3F3,
                                                    //     borderRadius: BorderRadius.circular(8.0)
                                                    //   ),
                                                    //   child: Center(
                                                    //     child: Padding(
                                                    //       padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                                                    //       child: Text(
                                                    //         'Continental',
                                                    //         style: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
                                                    //           decoration: TextDecoration.none,
                                                    //           fontFamily: AppTextTheme.ttHovesMedium,
                                                    //           color: AppTextTheme.color2D2D33,
                                                    //         )
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                 
                                                  ],
                                                ),
                                              ),
                              // Hot site and view on map
                              SizedBox(height: Get.height * 0.02),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.6,
                                      // height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                        color: AppTextTheme.colorFFFBE9,
                                        border: Border.all(
                                          width: 1,
                                          color: AppTextTheme.colorF9EFC0,
                                        ),
                                        borderRadius: BorderRadius.circular(9.0)
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: Get.height * 0.02),
                                          SizedBox(
                                            width: Get.width * 0.55,
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppTextTheme.colorF9EFC0
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Image.asset(
                                                      Constant.radarIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.005),
                                          SizedBox(
                                            width: Get.width * 0.55,
                                            child: Text(
                                              'Hot site',
                                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                decoration: TextDecoration.none,
                                                fontFamily: AppTextTheme.ttHovesMedium,
                                                color: AppTextTheme.color2D2D33,
                                              )
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.005),
                                          SizedBox(
                                            width: Get.width * 0.55,
                                            child: Row(
                                              children: [
                                                Text(
                                                  snapshot.data?.data?.analytics?[0].views.toString() ?? '0',
                                                  // '0',
                                                  style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                    // decoration: TextDecoration.underline,
                                                    // decorationColor: AppTextTheme.colorF8D20F,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33,
                                                  )
                                                ),
                                                const SizedBox(width: 5),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 0),
                                                  child: Text(
                                                    'user viewed this place',
                                                    style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                      decoration: TextDecoration.none,
                                                      fontFamily: AppTextTheme.ttHovesRegular,
                                                      color: AppTextTheme.color828898,
                                                    )
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.015)
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: Get.width * 0.28,
                                      // height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                        color: AppTextTheme.colorEBFD7C,
                                        borderRadius: BorderRadius.circular(9.0)
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: Get.height * 0.02),
                                          SizedBox(
                                            width: Get.width * 0.2,
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppTextTheme.white
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Image.asset(
                                                      Constant.mapviewIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.008),
                                          SizedBox(
                                            width: Get.width * 0.2,
                                            child: Text(
                                                'View on\nMap',
                                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                fontFamily: AppTextTheme.ttHovesMedium,
                                                color: AppTextTheme.color2D2D33,
                                              )
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.015)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // More about business
                              SizedBox(height: Get.height * 0.03),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Text(
                                  'More about business',
                                  style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33,
                                  )
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Text(
                                   snapshot.data?.data?.aboutBusiness ?? '',
                                  //'Splash around in 20 million gallons of water as it rushes through our high-speed water slides. Float along our river ride, conquer the water-play fort, and explore all 11 sparkling swimming pools.\n\nDip your toes into 5 miles of white sand beaches, dive into any of our 11 pools, and explore more than 20 uniquely swimmable spots, including pools designed for families and kids.\n\nFind your secluded spot or claim your place in the heart of the action at any one of our 11 pools. All cabanas are family-friendly and are available for small and large groups or events.',
                                  style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesRegular,
                                    color: AppTextTheme.color6D7076,
                                  )
                                ),
                              ),
                              // divider
                              SizedBox(height: Get.height * 0.03),
                              Container(
                                width: Get.width * 0.9,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: AppTextTheme.black.withOpacity(0.10)
                                ),
                              ),            
                              // connect with bussiness
                              SizedBox(height: Get.height * 0.03),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Text(
                                  'Connect with business',
                                  style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33,
                                  )
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              SizedBox( width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    // facebook
                                    GestureDetector(
                                          onTap: () {
                                            Constant.launchURL(
                                              controller.facebook.value == ''
                                              ?
                                              "https://www.facebook.com/<${snapshot.data!.data!.social!.facebook}>/"
                                              :
                                              "https://www.facebook.com/<${controller.facebook.value.toString()}>/"
                                            );
                                          },
                                          child: SizedBox(
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.4,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppTextTheme.colorFEF8DC,
                                                borderRadius: BorderRadius.circular(8.0)
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.35,
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset(
                                                      Constant.facebookIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    const SizedBox(width: 10),
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
                                    ),
                                    // SizedBox(width: Get.width * 0.03),
                                    const Spacer(),
                                    // intagram
                                    GestureDetector(
                                          onTap: () {
                                            Constant.launchURL(
                                              controller.instagram.value == ''
                                              ?
                                              "https://www.instagram.com/<${snapshot.data!.data!.social!.instagram}>/"
                                              :
                                              "https://www.instagram.com/<${controller.instagram.value.toString()}>/"
                                            );
                                          },
                                          child: SizedBox(
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.4,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppTextTheme.colorFEF8DC,
                                                borderRadius: BorderRadius.circular(8.0)
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.35,
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset(
                                                      Constant.instagramIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Instagram',
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
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    // Whatsapp
                                    GestureDetector(
                                          onTap: () {
                                            Constant.launchURL(
                                              // "whatsapp://send?phone=${snapshot.data?.data?.contact.toString()}"
                                              controller.whatsapp.value == ''
                                              ?
                                              "https://wa.me/=${snapshot.data?.data?.contact.toString()}"
                                              :
                                              "https://wa.me/=${controller.whatsapp.value}"
                                            );
                                          },
                                          child: SizedBox(
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.4,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppTextTheme.colorFEF8DC,
                                                borderRadius: BorderRadius.circular(8.0)
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.35,
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset(
                                                      Constant.whatsappIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Whatsapp',
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
                                    ),
                                    // SizedBox(width: Get.width * 0.03),
                                    const Spacer(),
                                    // Website
                                    GestureDetector(
                                          onTap: () {
                                            Constant.launchURL(
                                              // "${snapshot.data!.data!.social!.website}"
                                              controller.whatsapp.value == ''
                                              ?
                                              'https://www.bahamas.com'
                                              :
                                              'https://${controller.websiteUrl.value.toString()}'
                                            );
                                          },
                                          child: SizedBox(
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.4,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppTextTheme.colorFEF8DC,
                                                borderRadius: BorderRadius.circular(8.0)
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.35,
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset(
                                                      Constant.globeIcon,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Website',
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
                                    ),
                                  ],
                                ),
                              ),
                              // divider
                              SizedBox(height: Get.height * 0.05),
                              Container(
                                width: Get.width * 0.9,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: AppTextTheme.black.withOpacity(0.10)
                                ),
                              ),
                              // Reviews and ratings
                              SizedBox(height: Get.height * 0.03),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    Text(
                                      'Reviews',
                                      style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                        decoration: TextDecoration.none,
                                        fontFamily: AppTextTheme.ttHovesMedium,
                                        color: AppTextTheme.color2D2D33,
                                      )
                                    ),
                                    const SizedBox(width: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0),
                                      child: Text(
                                        snapshot.data?.data?.reviewCount?.toString() ?? '',
                                        // '152',
                                        style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                          decoration: TextDecoration.none,
                                          fontFamily: AppTextTheme.ttHovesRegular,
                                          color: AppTextTheme.color6D7076,
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.43,
                                      child: DropdownButtonFormField(
                                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                          decoration: InputDecoration(
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
                                              color: AppTextTheme.color2D2D33,
                                            ),
                                            hintText: "Verified",
                                            fillColor: Colors.white
                                          ),
                                          value: dropDownValue,
                                          onChanged: (String? value) {
                                            setState(() {
                                              dropDownValue = value;
                                            });
                                          },
                                          items: verificationList
                                              .map((cityTitle) => DropdownMenuItem(
                                                  value: cityTitle, child: Text(cityTitle)))
                                              .toList(),
                                        ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: Get.width * 0.43,
                                      child: DropdownButtonFormField(
                                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                          decoration: InputDecoration(
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
                                              color: AppTextTheme.color2D2D33,
                                            ),
                                            hintText: "All ratings",
                                            fillColor: Colors.white
                                          ),
                                          value: dropDownValue1,
                                          onChanged: (String? value) {
                                            setState(() {
                                              dropDownValue1 = value;
                                            });
                                          },
                                          items: ratingList
                                              .map((cityTitle) => DropdownMenuItem(
                                                  value: cityTitle, child: Text(cityTitle)))
                                              .toList(),
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                              // Review list here
                              SizedBox(height: Get.height * 0.02),
                              Visibility(
                                visible: snapshot.data!.data!.reviewCount == 0 ? false : true,
                                child: SizedBox(
                                  width: Get.width * 0.9,
                                  child: ListView.builder(
                                    itemCount: snapshot.data?.data?.reviews?.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: Container(
                                                width: Get.width * 0.6,
                                                decoration: BoxDecoration(
                                                  color: AppTextTheme.colorFFFBE9,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: AppTextTheme.colorF9EFC0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(9.0)
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: Get.height * 0.02),
                                                    // profile image, name and daate container
                                                    SizedBox(
                                                      width: Get.width * 0.8,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                                decoration: BoxDecoration(
                                                                  color: AppTextTheme.colorF9EFC0,
                                                                  borderRadius: BorderRadius.circular(7.0)
                                                                ),
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  width: 40,
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(7),
                                                                    child: Image.network(
                                                                      snapshot.data?.data?.reviews?[index].userId1?.image.toString() ?? '',
                                                                      fit: BoxFit.cover,
                                                                      height: 40,
                                                                      width: 40,
                                                                      loadingBuilder:
                                                                          (context, child, loadingProgress) {
                                                                        if (loadingProgress == null) {
                                                                          return child;
                                                                        }
                                                                        return Container(
                                                                          height: 40,
                                                                          width: 40,
                                                                          color: Colors.grey.withOpacity(0.3),
                                                                          child: const SizedBox(
                                                                              height: 40,
                                                                              child: Center(
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
                                                                              height: 40,
                                                                              width: 40,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(7.0),
                                                                                  border: Border.all(
                                                                                      width: 0.5,
                                                                                      color: Colors.grey)
                                                                                  ),
                                                                              child: Icon(
                                                                                Icons.person_2_outlined,
                                                                                color: Colors.grey.withOpacity(0.5),
                                                                                size: 40,
                                                                              )
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                )
                                                              ),               
                                                              
                                                          const SizedBox(width: 10),
                                                          SizedBox(
                                                            width: Get.width * 0.4,
                                                            child: Text(
                                                              snapshot.data?.data?.reviews?[index].userId1?.fullName ?? '',
                                                              // 'Julia Berlin',
                                                              style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                                decoration: TextDecoration.none,
                                                                fontFamily: AppTextTheme.ttHovesMedium,
                                                                color: AppTextTheme.color2D2D33,
                                                              )
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            snapshot.data?.data?.reviews?[index].date?.toString().covnertDateFormat() ?? 'Date',
                                                            // 'May 28',
                                                            style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                              decoration: TextDecoration.none,
                                                              fontFamily: AppTextTheme.ttHovesRegular,
                                                              color: AppTextTheme.color6D7076,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: Get.height * 0.005),
                                                     SizedBox(
                                                          width: Get.width * 0.81,
                                                          child: RatingBarIndicator(
                                                              rating: double.parse(snapshot.data?.data?.reviews?[index].ratingStars.toString() ?? ''),
                                                              // rating: 4.6,
                                                              itemBuilder: (context, index) => Padding(
                                                                padding: const EdgeInsets.only(right: 2, bottom: 2, top: 2),
                                                                child: Image.asset(
                                                                  Constant.ratingStarIcon,
                                                                  height: 6,
                                                                  width: 6,
                                                                ),
                                                              ),
                                                              itemCount: 5,
                                                              itemSize: 20.0,
                                                              direction: Axis.horizontal,
                                                          ),
                                                        ),
                                                        
                                                    SizedBox(height: Get.height * 0.005),
                                                    SizedBox(
                                                      width: Get.width * 0.8,
                                                      child: Text(
                                                            snapshot.data?.data?.reviews?[index].comments ?? '',
                                                            style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                              decoration: TextDecoration.none,
                                                              fontFamily: AppTextTheme.ttHovesRegular,
                                                              color: AppTextTheme.color828898,
                                                            )
                                                      ),
                                                    ),
                                                    SizedBox(height: Get.height * 0.02),
                                                  ],
                                                ),
                                              ),
                                      ); 
                                    }
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.width * 0.1),
                          ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              } else if(snapshot.hasError){
                return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
              } else {
                return Container();
              }
            }
          ),
        
        ),
      ),
    );
  }
}