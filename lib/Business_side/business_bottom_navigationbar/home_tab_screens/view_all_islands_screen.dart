import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/explore_island_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/explore_controller.dart';
import 'package:bahamas/data/models/get_all_islands_model.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllIslandScreen extends StatefulWidget {
  const ViewAllIslandScreen({super.key});

  @override
  State<ViewAllIslandScreen> createState() => _ViewAllIslandScreenState();
}

class _ViewAllIslandScreenState extends State<ViewAllIslandScreen> {

  ExploreController exploreController = Get.find();

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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
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
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              SizedBox(
                width: Get.width * 0.9,
                child: Text(
                  'The Bahamas Islands',
                  style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                    decoration: TextDecoration.none,
                    fontFamily: AppTextTheme.ttHovesDemiBold,
                    color: AppTextTheme.color2D2D33,
                  )
                ),
              ),
              SizedBox(height: Get.height * 0.015),  
              
              // no of islands
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
                          child: Obx(()
                            => Text(
                              '${exploreController.islandsCount.value} Islands',
                              // '16 Islands',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33,
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,   
              SizedBox(height: Get.height * 0.02), 
              FutureBuilder<GetAllIslandsModel>(
                      future: exploreController.getAllIslands(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Loading...'),
                              ],
                            ),
                          );
                        }else if(snapshot.hasData){
                          if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                            return const Text(('No internet connect'));
                          } else if(snapshot.data?.data.toString() == 'null'){
                            return const Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(('No island found')),
                                  ],
                                ),
                            );
                          }else {
                            return Expanded(
                              child: SizedBox(
                                width: Get.width * 0.9,
                                child: GridView.builder(  
                                itemCount: snapshot.data!.data!.length,  
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                                    crossAxisCount: 2,  
                                    crossAxisSpacing: Get.width * 0.04,  
                                    mainAxisSpacing: Get.height * 0.02,
                                    childAspectRatio: (1 / 1.2)
                                ),  
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => ExploreIslandsScreen(islandDetail: snapshot.data!.data![index]));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: islandssList[index]['Color'],
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: Get.height * 0.01),
                                          SizedBox(
                                            width: Get.width * 0.3,
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
                                            width: Get.width * 0.3,
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
                                            width: Get.width * 0.36,
                                              child: Text(
                                                snapshot.data?.data?[index].island ?? '',
                                                // islandssList[index]['Name'],
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
                                            width: Get.width * 0.36,
                                            child: Row(
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    'Explore places',
                                                    style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                                      decoration: TextDecoration.none,
                                                      fontFamily: AppTextTheme.ttHovesRegular,
                                                      color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Image.asset(
                                                  Constant.arrow45Icon,
                                                  color: index == 0 ? AppTextTheme.white : AppTextTheme.color2D2D33,
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                // const Spacer()
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: Get.height * 0.02),
                                        ],
                                      ),
                                    ),
                                  );
                                  },  
                                ),
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
           
            ],
          ),
        ),
      ),
    );
  }
}