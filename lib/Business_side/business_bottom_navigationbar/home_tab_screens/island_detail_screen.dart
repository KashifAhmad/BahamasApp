import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/rating_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/Utils/extensions.dart';
import 'package:bahamas/data/controller/explore_controller.dart';
import 'package:bahamas/data/controller/saved_business_controller.dart';
import 'package:bahamas/data/models/get_all_buisnesses_by_island_model.dart';
import 'package:bahamas/data/models/get_all_businesses_by_category_model.dart';
import 'package:bahamas/data/models/get_business_feed_model.dart';
import 'package:bahamas/data/models/get_most_popular_businesses_model.dart';
import 'package:bahamas/data/models/get_search_business_model.dart';
import 'package:bahamas/data/models/get_specific_business_model.dart';
import 'package:bahamas/data/models/get_user_detail_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IslandDetailsScreen extends StatefulWidget {
  final GetSaveBusinessDetailData? islandDetail;
  final GetBusinessFeedsData? businessFeed;
  final GetMostpopularBusinessesData? mostPopular;
  final BusinessesByIslandData? businessesByIsland;
  final BusinessesByCategoryData? businessesBycategory;
  final SearchBusinessByNameData? searchBusinessesByName;
  final String? screenName;
  const IslandDetailsScreen({super.key, this.islandDetail, this.businessFeed, this.screenName, this.mostPopular, this.businessesByIsland, this.businessesBycategory, this.searchBusinessesByName});

  @override
  State<IslandDetailsScreen> createState() => _IslandDetailsScreenState();
}

class _IslandDetailsScreenState extends State<IslandDetailsScreen> {

  SavedBusinessController controller = Get.find();
  ExploreController exploreController = Get.find();

  PageController pageViewController = PageController();

  String? verificationDropDownValue;
  String? ratingListDropDownValue;
  List<String> verificationList = [
    'Verified',
    'Not verified',
  ];
  List<String> ratingList = [
    'All ratings',
    'Few ratings',
  ];

  List reviewList = [
    {'Name': 'Julia Berlin', 'Date': 'June 11', 'Image': Constant.juliaImage},
    {'Name': 'Jennifer Smith', 'Date': 'May 28', 'Image': Constant.jenniferImage},

  ];

  @override
  void initState() {
    super.initState();
    debugPrint('Screen Name: ${widget.screenName.toString()}');
    callViewBusiness();
  }

  callViewBusiness() async{
   await  exploreController.viewBusinessApi(
      widget.screenName!.contains('Saved Business')
      ?
      widget.islandDetail!.business!.sId.toString()
      : 
      widget.screenName!.contains('Most Popular')
      ?
      widget.mostPopular!.sId.toString()
      :
      widget.screenName!.contains('By Island')
      ?
      widget.businessesByIsland!.sId.toString()
      :
      widget.screenName!.contains('By Category')
      ?
      widget.businessesBycategory!.sId.toString()
      :
      widget.screenName!.contains('Search Business')
      ?
      widget.searchBusinessesByName!.sId.toString()
      :
      widget.businessFeed!.businessId!.sId.toString()
   );
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
            future: controller.getSpecificBusiness(
              widget.screenName!.contains('Saved Business')
              ?
              widget.islandDetail!.business!.sId.toString()
              : 
              widget.screenName!.contains('Most Popular')
              ?
              widget.mostPopular!.sId.toString()
              :
              widget.screenName!.contains('By Island')
              ?
              widget.businessesByIsland!.sId.toString()
              :
              widget.screenName!.contains('By Category')
              ?
              widget.businessesBycategory!.sId.toString()
              :
              widget.screenName!.contains('Search Business')
              ?
              widget.searchBusinessesByName!.sId.toString()
              :
              widget.businessFeed!.businessId!.sId.toString()
            ),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Text('Loading');
                // return const SavedBusinessShimmerWidget();
              }else if(snapshot.hasData){
                if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                  return const Text(('No internet connect'));
                } 
                else if(snapshot.data?.data.toString() == 'null'){
                  return SafeArea(
                    child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.03),
                            child: Center(
                              child: SizedBox(
                                width: Get.width * 0.9,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Image.asset(
                                        Constant.backArrowIcon,
                                        color: AppTextTheme.black,
                                        height: 24,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(('No business detail found')),
                          const Spacer(),
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
                                          
                                snapshot.data!.data!.gallery!.isEmpty
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
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Image.asset(
                                          Constant.backArrowIcon,
                                          color: AppTextTheme.white,
                                          height: 24,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          debugPrint('business detail heart tapped');
                                          if(exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data!.sId!)) {
                                            exploreController.unSavedBusinessApi(snapshot.data!.data!.sId!, SessionController().user?.data?.sId.toString() ?? '', false);
                                          } else {
                                            exploreController.savedBusinessApi(snapshot.data!.data!.sId!, SessionController().user?.data?.sId.toString() ?? '', true);
                                          }
                                        },
                                        child: Obx(() =>
                                          Icon(
                                            Icons.favorite,
                                            color: exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data!.sId!)
                                            ? Colors.red
                                            : Colors.white,
                                            size: 24
                                          ),
                                        )
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
                                        snapshot.data?.data?.averageRating.toString() ?? '0',
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
                                    visible: snapshot.data!.data!.gallery!.isEmpty ? false : true,
                                    child: SmoothPageIndicator(
                                      controller: pageViewController,
                                      count: snapshot.data!.data!.gallery!.isEmpty ? 0 : snapshot.data!.data!.gallery!.length,
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
                              child: Text(
                                                snapshot.data?.data?.name ?? '',
                                                // 'Cabbage Beach',
                                                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: AppTextTheme.ttHovesMedium,
                                                  color: AppTextTheme.color2D2D33,
                                                )
                                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.9,
                              child: Text(
                                                snapshot.data?.data?.address ?? '',
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
                                                          // 'Boating',
                                                          style: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
                                                            decoration: TextDecoration.none,
                                                            fontFamily: AppTextTheme.ttHovesMedium,
                                                            color: AppTextTheme.color2D2D33,
                                                          )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                  GestureDetector(
                                    onTap: () {
                                      //'https://www.google.com/maps/dir/?api=1&origin=${points.latitude},${points.longitude}&destination=${widget.visitDetail!.doctorId!.location!.coordinates![1]},${widget.visitDetail!.doctorId!.location!.coordinates![0]}&travelmode=driving&dir_action=navigate';
                                      Constant.launchURL(
                                        "https://www.google.com/maps/search/?api=1&query=${snapshot.data!.data!.location!.coordinates![0]},${snapshot.data!.data!.location!.coordinates![0]}"
                                      );
                                    },
                                    child: Container(
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
                                snapshot.data?.data?.aboutBusiness.toString() ?? '',
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
                                            "https://www.facebook.com/<${snapshot.data!.data!.social!.facebook}>/"
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
                                        onTap: () {},
                                        child: SizedBox(
                                          height: Get.height * 0.07,
                                          width: Get.width * 0.4,
                                          child: GestureDetector(
                                            onTap: () {
                                              Constant.launchURL(
                                                "https://www.instagram.com/<${snapshot.data!.data!.social!.instagram}>/"
                                              );
                                            },
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
                                          // snapshot.data?.data?.contact;
                                          Constant.launchURL(
                                            // "whatsapp://send?phone=${snapshot.data?.data?.contact.toString()}"
                                            "https://wa.me/=${snapshot.data?.data?.contact.toString()}"
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
                                              'https://www.bahamas.com'
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
                                      snapshot.data?.data?.reviewCount.toString() ?? '',
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
                                        value: verificationDropDownValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            verificationDropDownValue = value;
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
                                        value: ratingListDropDownValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            ratingListDropDownValue = value;
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
                            // SizedBox(
                            //   width: Get.width * 0.9,
                            //   child: ListView.builder(
                            //     itemCount: snapshot.data!.data!.reviews!.length,
                            //     shrinkWrap: true,
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     padding: const EdgeInsets.all(0),
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return Padding(
                            //         padding: const EdgeInsets.only(bottom: 20),
                            //         child: Container(
                            //                 width: Get.width * 0.6,
                            //                 decoration: BoxDecoration(
                            //                   color: AppTextTheme.colorFFFBE9,
                            //                   border: Border.all(
                            //                     width: 1,
                            //                     color: AppTextTheme.colorF9EFC0,
                            //                   ),
                            //                   borderRadius: BorderRadius.circular(9.0)
                            //                 ),
                            //                 child: Column(
                            //                   children: [
                            //                     SizedBox(height: Get.height * 0.02),            
                            //                     // profile image, name and daate container
                            //                     SizedBox(
                            //                       width: Get.width * 0.8,
                            //                       child: Row(
                            //                         children: [
                            //                           Container(
                            //                             decoration: BoxDecoration(
                            //                               color: AppTextTheme.colorF9EFC0,
                            //                               borderRadius: BorderRadius.circular(10.0)
                            //                             ),
                            //                             child: Image.asset(
                            //                               reviewList[index]['Image'],
                            //                               // Constant.juliaImage,
                            //                               height: 40,
                            //                               width: 40,
                            //                               fit: BoxFit.fill,
                            //                             ),
                            //                           ),
                            //                           const SizedBox(width: 10),
                            //                           SizedBox(
                            //                             width: Get.width * 0.4,
                            //                             child: Text(
                            //                               reviewList[index]['Name'],
                            //                               // 'Julia Berlin',
                            //                               style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                            //                                 decoration: TextDecoration.none,
                            //                                 fontFamily: AppTextTheme.ttHovesMedium,
                            //                                 color: AppTextTheme.color2D2D33,
                            //                               )
                            //                             ),
                            //                           ),
                            //                           const Spacer(),
                            //                           Text(
                            //                             reviewList[index]['Date'],
                            //                             // 'May 28',
                            //                             style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                            //                               decoration: TextDecoration.none,
                            //                               fontFamily: AppTextTheme.ttHovesRegular,
                            //                               color: AppTextTheme.color6D7076,
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                     SizedBox(height: Get.height * 0.005),
                            //                     SizedBox(
                            //                       width: Get.width * 0.8,
                            //                       height: 30,
                            //                       child: ListView.builder(
                            //                         itemCount: 5,
                            //                         shrinkWrap: true,
                            //                         scrollDirection: Axis.horizontal,
                            //                         itemBuilder: (context, index) {
                            //                           return Padding(
                            //                             padding: const EdgeInsets.only(right: 3.0),
                            //                             child: Image.asset(
                            //                               Constant.ratingStarIcon,
                            //                               height: 12,
                            //                               width: 12,
                            //                             ),
                            //                           );
                            //                         }
                            //                       )
                            //                     ),
                            //                     SizedBox(height: Get.height * 0.005),
                            //                     SizedBox(
                            //                       width: Get.width * 0.8,
                            //                       child: Text(
                            //                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            //                             style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                            //                               decoration: TextDecoration.none,
                            //                               fontFamily: AppTextTheme.ttHovesRegular,
                            //                               color: AppTextTheme.color828898,
                            //                             )
                            //                       ),
                            //                     ),
                            //                     SizedBox(height: Get.height * 0.02),
                            //                   ],
                            //                 ),
                            //               ),
                            //       );
                            //     }
                            //   ),
                            // ),
                            
                            SizedBox(
                              width: Get.width * 0.9,
                              child: ListView.builder(
                                itemCount: snapshot.data?.data?.reviews?.length ?? 0,
                                // itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemBuilder: (BuildContext context, int reviewsIndex) {
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
                                                                      snapshot.data?.data?.reviews?[reviewsIndex].userId1?.image.toString() ?? '',
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
                                                                  snapshot.data!.data!.reviews![reviewsIndex].userId1?.fullName.toString() ?? '',
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
                                                                snapshot.data?.data?.reviews?[reviewsIndex].date?.covnertDateFormat() ?? 'Date',
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
                                                        SizedBox(height: Get.height * 0.009),
                                                        SizedBox(
                                                          width: Get.width * 0.81,
                                                          child: RatingBarIndicator(
                                                              rating: double.parse(snapshot.data?.data?.reviews?[reviewsIndex].ratingStars.toString() ?? ''),
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
                                                        
                                                        SizedBox(height: Get.height * 0.007),
                                                        SizedBox(
                                                          width: Get.width * 0.8,
                                                          child:Text(
                                                            snapshot.data?.data?.reviews?[reviewsIndex].userId1?.fullName ?? '',
                                                            // 'Julia Berlin',
                                                            style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                              decoration: TextDecoration.none,
                                                              fontFamily: AppTextTheme.ttHovesMedium,
                                                              color: AppTextTheme.color2D2D33,
                                                            )
                                                          ),
                                                        ),
                                                        
                                                        SizedBox(height: Get.height * 0.005),
                                                        SizedBox(
                                                          width: Get.width * 0.8,
                                                          child: Text(
                                                                snapshot.data?.data?.reviews?[reviewsIndex].comments.toString() ?? '',
                                                                // 'jksdb sd skdjb',
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
                            
                            // review button
                            GestureDetector(
                                onTap: () {
                                  Get.to(() => const RatingScreen());
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
                                        'Write a review',
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