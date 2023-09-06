import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/explore_island_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/island_detail_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/search_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/view_all_islands_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/my_profile_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/explore_controller.dart';
import 'package:bahamas/data/controller/profile_controller.dart';
import 'package:bahamas/data/controller/saved_business_controller.dart';
import 'package:bahamas/data/models/get_all_categories_model.dart';
import 'package:bahamas/data/models/get_all_islands_model.dart';
import 'package:bahamas/data/models/get_most_popular_businesses_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SavedBusinessController controller = Get.put(SavedBusinessController());
  ProfileController profileController = Get.put(ProfileController());
  ExploreController exploreController = Get.put(ExploreController());

  String? imageLink;

  @override
  void initState() {
    super.initState();
    imageLink = SessionController().user?.data?.image ?? '';
    getSavedBusinesses1();
  
  }

  getSavedBusinesses1() async{
    var userId = SessionController().user?.data?.sId ?? '';
    await exploreController.getUserDetailWithBusiness(userId);
    if(SessionController().user?.data?.profileType.toString() == 'Business') {
      exploreController.getBusinessByUser(userId);
    }
  }
  


  // List categories = [
  //   {'Name': 'Restaurant', 'Icon': Constant.restaurantIcon},
  //   {'Name': 'Hotels', 'Icon': Constant.hotelIcon},
  //   {'Name': 'Cafe', 'Icon': Constant.cafeIcon},
  //   {'Name': 'Casino', 'Icon': Constant.casinoIcon},
  //   {'Name': 'Education', 'Icon': Constant.educationIcon},
  //   {'Name': 'Nightlife', 'Icon': Constant.nightlifeIcon},
  //   {'Name': 'Play areas', 'Icon': Constant.playAreaIcon},
  //   {'Name': 'Boating', 'Icon': Constant.boatingIcon},
  //   {'Name': 'Show all', 'Icon': ''},
  // ];

  List islandssList = [
    {'Name': 'Grand Bahama', 'Color': AppTextTheme.color7C6DF6},
    {'Name': 'New Providence', 'Color': AppTextTheme.colorF6C6DC},
    {'Name': 'Abaco ', 'Color': AppTextTheme.colorFEF8DC},
    {'Name': 'Acklins Island', 'Color': AppTextTheme.colorB2FFCC},
    {'Name': 'The Berry Island', 'Color': AppTextTheme.colorC2E1FF},
    {'Name': 'Andros Island', 'Color': AppTextTheme.colorFFCDC2},
    {'Name': 'Bimini Island', 'Color': AppTextTheme.colorE7E8E9},
    {'Name': 'Cat Island', 'Color': AppTextTheme.colorF6E9C6},
    {'Name': 'Eleuthera Island', 'Color': AppTextTheme.colorCCC6FE},
    {'Name': 'The Exumas Island', 'Color': AppTextTheme.colorF6C6DC},
    {'Name': 'Mayaguana Island', 'Color': AppTextTheme.colorFEF8DC},
    {'Name': 'Long Island', 'Color': AppTextTheme.colorB2FFCC},
    {'Name': 'Inagua Island', 'Color': AppTextTheme.colorC2E1FF},
    {'Name': 'San Salvador', 'Color': AppTextTheme.colorFFCDC2},
    {'Name': 'Rum Cay Island', 'Color': AppTextTheme.colorE7E8E9},
    {'Name': 'Ragged Island', 'Color': AppTextTheme.colorF6E9C6}
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [          
            SingleChildScrollView(
            child: 
                Column(
                children: [
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Row(
                      children: [
                        Image.asset(
                          Constant.splashLogo,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: Get.height * 0.015),
                        Text(
                          'Archipelago',
                          style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            decoration: TextDecoration.none,
                            fontFamily: AppTextTheme.ttHovesDemiBold,
                            color: AppTextTheme.color2D2D33
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          Constant.notificationStatusIcon,
                          height: 25,
                          width: 25,
                        ),
                        Visibility(
                          visible: SessionController().user?.data?.profileType == 'User' ? false : true,
                          child: const SizedBox(width: 20)
                        ),
                        Visibility(
                          visible: SessionController().user?.data?.profileType == 'User' ? false : true,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const MyProfileScreen());
                            },
                            child: Obx(() => profileController.imageFilePath.value != ""
                                      ? Container(
                                        height: 35,
                                        width: 35,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        child: Image.file(
                                          File(profileController.imageFilePath.value),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                      : imageLink != null
                                          ? SizedBox(
                                              height: 35,
                                              width: 35,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10.0),
                                              child: Image.network(
                                                imageLink!,
                                                fit: BoxFit.cover,
                                                height: 35,
                                                width: 35,
                                                loadingBuilder:
                                                    (context, child, loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Container(
                                                    height: 35,
                                                    width: 35,
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
                                                        height: 35,
                                                        width: 35,
                                                        clipBehavior: Clip.antiAlias,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors.grey)
                                                            ),
                                                        child: Icon(
                                                          Icons.person_2_outlined,
                                                          color: Colors.grey.withOpacity(0.5),
                                                          size: 30,
                                                        )
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                          : const SizedBox()),
                                      
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.03),
                        // Searchfield container
                        Container(
                          width: Get.width * 0.9,
                          // height: Get.height * 0.2,
                          decoration: BoxDecoration(
                            color: AppTextTheme.colorEBFD7C1,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * 0.03),
                              SizedBox(
                                // color: Colors.amber,
                                width: Get.width * 0.8,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      // color: Colors.red,
                                      width: Get.width * 0.5,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Find the best place to\nin the bahamas',
                                          maxLines: 2,
                                          style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
                                            decoration: TextDecoration.none,
                                            fontFamily: AppTextTheme.ttHovesMedium,
                                            color: AppTextTheme.color2D2D33
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 27.0),
                                      child: Container(
                                        width: Get.width * 0.22,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: AppTextTheme.colorB8F268,
                                          borderRadius: BorderRadius.circular(20.0)
                                        ),
                                        child: Center(
                                          // child: Text(
                                          //   'explore',
                                            // style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                            //   decoration: TextDecoration.none,
                                            //   fontFamily: AppTextTheme.ttHovesMedium,
                                            //   color: AppTextTheme.color2D2D33
                                            // ),
                                          // ),
                                          child: Center(
                                            child: AnimatedTextKit(
                                              isRepeatingAnimation: true,
                                              totalRepeatCount: 1000,
                                              animatedTexts: [
                                                FadeAnimatedText(
                                                  'explore',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'eat',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'drink',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'travel',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'party',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'fun',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                                FadeAnimatedText(
                                                  'romance',
                                                    duration: const Duration(milliseconds: 6000),
                                                    textStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33
                                                  ),
                                                ),
                                              ],
                                              onTap: () {
                                                debugPrint("Tap Event");
                                              },
                                            ),
                                          ),
                                                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: Get.width * 0.8,
                              //     child: FittedBox(
                              //       fit: BoxFit.scaleDown,
                              //       child: Text(
                              //       'in the bahamas',
                              //       style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
                              //         decoration: TextDecoration.none,
                              //         fontFamily: AppTextTheme.ttHovesMedium,
                              //         color: AppTextTheme.color2D2D33
                              //       ),
                              //                                 ),
                              //     )
                              // ),
                              SizedBox(height: Get.height * 0.015),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>const SearchScreen());
                                },
                                child: Container(
                                  height: 50,
                                  width: Get.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: AppTextTheme.black.withOpacity(0.10),
                                      width: 1
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: Get.width * 0.75,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Constant.searchIcon,
                                            height: 24,
                                            width: 24,
                                          ),
                                          SizedBox(width: Get.width * 0.03),
                                          Text(
                                            'Find in',
                                            style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                              decoration: TextDecoration.none,
                                              fontFamily: AppTextTheme.ttHovesMedium,
                                              color: AppTextTheme.color2D2D33
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          SizedBox(
                                            width: Get.width * 0.3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 22.0),
                                              child: TextField(
                                                // controller: searchControllerr,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Nassau',
                                                  hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33.withOpacity(0.30)
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        // By categories
                        SizedBox(height: Get.height * 0.02),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Row(
                            children: [
                              Text(
                                'By categories',
                                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color2D2D33
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        
                        FutureBuilder<GetAllCategoryModel>(
                          future: exploreController.getAllCategoriess(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return const Text('Loading');
                            }else if(snapshot.hasData){
                              if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                                return const Text(('No internet connect'));
                              } else if(snapshot.data?.data.toString() == 'null'){
                                return const SizedBox(
                                  height: 190,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(('No category found')),
                                      ],
                                    ),
                                );
                              }else {
                               return SizedBox(
                                  width: Get.width * 0.9,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    direction: Axis.horizontal,
                                    children: generateSelectedTypesTags(snapshot.data!.data!.length, context, snapshot.data!.data!),
                                  ),
                               );
                        
                              }
                            } else if(snapshot.hasError){
                              return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                            } else {
                              return Container();
                            }
                          }
                        ),
                         
            
                        // By Islandss
                        SizedBox(height: Get.height * 0.03),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Row(
                            children: [
                              Text(
                                'By islands',
                                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color2D2D33
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const ViewAllIslandScreen());
                                },
                                child: Text(
                                  'View all',
                                  style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesMedium,
                                    color: AppTextTheme.color2D2D33
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        
                        FutureBuilder<GetAllIslandsModel>(
                          future: exploreController.getAllIslands(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return const Text('Loading');
                            }else if(snapshot.hasData){
                              if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                                return const Text(('No internet connect'));
                              } else if(snapshot.data?.data.toString() == 'null'){
                                return const SizedBox(
                                  height: 190,
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(('No island found')),
                                        ],
                                      ),
                                  ),
                                );
                              }else {
                                return SizedBox(
                                height: 190,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: Get.width * 0.045),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => ExploreIslandsScreen(islandDetail: snapshot.data!.data![index]));
                                        },
                                        child: SizedBox(
                                          // height: Get.height * 0.23,
                                          width: Get.width * 0.5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: islandssList[index]['Color'],
                                              borderRadius: BorderRadius.circular(10.0)
                                            ),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: Get.height * 0.01),
                                                  SizedBox(
                                                    width: Get.width * 0.4,
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        Text(
                                                          snapshot.data!.data![index].totalBusinesses.toString(),
                                                          // '28',
                                                          style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
                                                            decoration: TextDecoration.none,
                                                            fontFamily: AppTextTheme.ttHovesDemiBold,
                                                            color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.4,
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        Text(
                                                          'Places',
                                                          style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                            decoration: TextDecoration.none,
                                                            fontFamily: AppTextTheme.ttHovesMedium,
                                                            color: index == 0 ? AppTextTheme.white.withOpacity(0.30) : AppTextTheme.color2D2D33.withOpacity(0.30),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: Get.height * 0.02),
                                                  SizedBox(
                                                    width: Get.width * 0.4,
                                                    child: Text(
                                                      snapshot.data?.data?[index].island.toString() ?? '',
                                                      maxLines: 2,
                                                      style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
                                                        decoration: TextDecoration.none,
                                                        fontFamily: AppTextTheme.ttHovesDemiBold,
                                                        color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  SizedBox(
                                                    width: Get.width * 0.4,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Explore places',
                                                          style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                            decoration: TextDecoration.none,
                                                            fontFamily: AppTextTheme.ttHovesRegular,
                                                            color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                          ),
                                                        ),
                                                        SizedBox(width: Get.width * 0.02),
                                                        Image.asset(
                                                          Constant.arrow45Icon,
                                                          color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                          height: 25,
                                                          width: 25,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              );
                        
                              }
                            } else if(snapshot.hasError){
                              return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                            } else {
                              return Container();
                            }
                          }
                        ),
                         
            
                        // Most popular
                        SizedBox(height: Get.height * 0.03),
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Row(
                            children: [
                              Text(
                                'Most popular',
                                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                  decoration: TextDecoration.none,
                                  fontFamily: AppTextTheme.ttHovesMedium,
                                  color: AppTextTheme.color2D2D33
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        FutureBuilder<GetMostPopularBusinessesModel>(
                          future: controller.mostPopularBusinessesApi(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return const Text('Loading');
                              // return const SavedBusinessShimmerWidget();
                            }  else if(snapshot.connectionState == ConnectionState.waiting) {
                              return const Text('Waiting');
                            }
                            else if(snapshot.hasData){
                              if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                                return const Text(('No internet connect'));
                              } else if(snapshot.data?.data.toString() == 'null'){
                                return const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(('No popular business found')),
                                    ],
                                  );
                              }else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.data!.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      try {
                                        debugPrint('All Saved business: ${exploreController.getAllSavedBusinessIdsList.toString()}');
                                        if (exploreController.getAllSavedBusinessIdsList.contains(snapshot.data!.data![index].sId!)) {
                                          exploreController.allSavedBusinessIdsList.add(snapshot.data!.data![index].sId!);
                                        }
                                      } catch (e) {
                                        
                                      }
                                      return Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => IslandDetailsScreen(mostPopular: snapshot.data!.data![index], screenName: 'Most Popular'));
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            SizedBox(
                                              width: Get.width * 0.9,
                                              height: 200,
                                              child: Stack(
                                                alignment: Alignment.center,
                                              children: [
                                                  snapshot.data!.data![index].gallery!.isEmpty
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
                                                      //   Constant.cabbageBeaachImage,
                                        // fit: BoxFit.fill,
                                    //),
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
                                                          snapshot.data?.data?[index].gallery?.first ?? '',
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
                                                          errorBuilder: (context, child, loadingProgress) {
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
                                                      
                                                    // heart icon
                                                    Positioned(
                                                      top: 5,
                                                      right: 5,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          debugPrint('taap');
                                                          if (exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index].sId!)) {
                                                            exploreController.unSavedBusinessApi(snapshot.data!.data![index].sId!, SessionController().user?.data?.sId.toString() ?? '', false);
                                                          } else {
                                                            exploreController.savedBusinessApi(snapshot.data!.data![index].sId!, SessionController().user?.data?.sId.toString() ?? '', true);
                                                          }
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 20, right: 20),
                                                          child: Obx(() =>
                                                            Icon(
                                                              Icons.favorite,
                                                              color: exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index].sId!)
                                                              ? Colors.red
                                                              : Colors.white,
                                                              size: 24
                                                            ),
                                                          )
                                                        )
                                                      ),
                                                    ),          
                                                    // rating
                                                    Positioned(
                                                      left: 2,
                                                      bottom: 5,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                                                        child: Container(
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
                                                                snapshot.data?.data?[index].averageRating.toString() ?? '',
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
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                             
                                            const SizedBox(height: 10),
                                            SizedBox(
                                                width: Get.width * 0.8,
                                                child: Text(
                                                  snapshot.data?.data?[index].name ?? '',
                                                  // 'Atlantis New Providence',
                                                  style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33,
                                                  )
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                width: Get.width * 0.8,
                                                child: Text(
                                                  snapshot.data?.data?[index].address ?? '',
                                                  // 'Four Season Resort - New Providence',
                                                  style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color828898,
                                                  )
                                                ),
                                              ),
                                              const SizedBox(height: 15),
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
                                                            snapshot.data?.data?[index].categoryId?.category.toString() ?? '',
                                                            // 'Hotel & Restaurant',
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
                                              SizedBox(height: Get.height * 0.03),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );  
                              }
                            } else if(snapshot.hasError){
                              return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                            } else {
                              return Container();
                            }
                          }
                        ),
                             
                      ],
                    ),
                  ),
                ],
              ),
        
          ),
          ]
        ),
      ),
    );
  }
}



// For categories
List<Widget> generateSelectedTypesTags(int count, BuildContext context, List categories) {
  List<Widget> items = [];
  for (int i = 0; i < count; i++) {
    items.add(generateSelectedTypeItem(120, 34, i, context, categories));
  }
  return items;
}

Widget generateSelectedTypeItem(
      double width, double height, int index, BuildContext context, List categories) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ExploreIslandsScreen(categoryDetail: categories[index], isFromCategory: true));
      },
      child: FittedBox(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.5),
              decoration: BoxDecoration(
                color: AppTextTheme.colorFEF8DC,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  categories[index].icon != null || categories[index].icon.toString() != 'null'
                  ?
                  Image.network(
                    categories[index].icon,
                    height: 24,
                    width: 24,
                  ) 
                  : 
                  const SizedBox(),
                  SizedBox(width: Get.width * 0.01),
                  Text(
                    categories[index].category,
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }