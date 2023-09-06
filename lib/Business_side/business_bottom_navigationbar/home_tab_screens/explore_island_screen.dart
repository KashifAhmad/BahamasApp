import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/island_detail_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/explore_controller.dart';
import 'package:bahamas/data/models/get_all_buisnesses_by_island_model.dart';
import 'package:bahamas/data/models/get_all_businesses_by_category_model.dart';
import 'package:bahamas/data/models/get_all_categories_model.dart';
import 'package:bahamas/data/models/get_all_islands_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreIslandsScreen extends StatefulWidget {
  final IslandsData? islandDetail;
  final CatagoryDetailData? categoryDetail;
  final bool? isFromCategory;
  const ExploreIslandsScreen({super.key, this.islandDetail, this.isFromCategory = false, this.categoryDetail});

  @override
  State<ExploreIslandsScreen> createState() => _ExploreIslandsScreenState();
}

class _ExploreIslandsScreenState extends State<ExploreIslandsScreen> {

  ExploreController exploreController = Get.find();

  // var model = widget.isFromCategory == true ? GetAllBusinessesByIslandsModel : GetAllBusinessesByIslandsModel;

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
                child: Row(
                  children: [
                    SizedBox(
                      width: widget.isFromCategory == true ? Get.width * 0.9 : Get.width * 0.6,
                      child: Text(
                        widget.isFromCategory == true
                        ?
                        widget.categoryDetail?.category.toString() ?? ''
                        :
                        widget.islandDetail?.island.toString() ?? '',
                        // 'Grand Bahama Island',
                        style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                          decoration: TextDecoration.none,
                          fontFamily: AppTextTheme.ttHovesDemiBold,
                          color: AppTextTheme.color2D2D33,
                        )
                      ),
                    ),
                    Visibility(
                      visible: widget.isFromCategory == true ? false : true,
                      child: SizedBox(
                        width: Get.width * 0.3,
                        child: Image.asset(
                          Constant.islandImage,
                          height: 36,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.015),  
              
              // no of places and businesses
              widget.isFromCategory == true 
              ?
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
                          child: Obx(() =>
                            Text(
                              int.parse(exploreController.categoryBusinessCount.value) > 1 
                              ?
                              '${exploreController.categoryBusinessCount.value.toString()} Businesses'
                              :
                              '${exploreController.categoryBusinessCount.value.toString()} Business',
                              // '28 Islands',
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
              )
              :
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
                              int.parse(widget.islandDetail!.totalBusinesses.toString()) > 1
                              ?
                              '${widget.islandDetail!.totalBusinesses.toString()} Places'
                              :
                              '${widget.islandDetail!.totalBusinesses.toString()} Place',
                              // '28 Islands',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
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
              SizedBox(height: Get.height * 0.02), 
              
              widget.isFromCategory == true 
              ?
              FutureBuilder<GetAllBusinessesBycategoryModel>(
                future: exploreController.getBusinessesByCategory(widget.categoryDetail?.sId.toString() ?? ''),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Loading'),
                              ],
                            ),
                          );
                    }else if(snapshot.hasData){
                          if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                            return const Text(('No internet connect'));
                          } else if(snapshot.data?.data.toString() == 'null' || snapshot.data!.data!.isEmpty){
                            return const Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(('No Business found')),
                                  ],
                                ),
                            );
                          }else {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.data!.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() =>  IslandDetailsScreen(screenName: 'By Category', businessesBycategory: snapshot.data!.data![index]));
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
                                                Container(
                                                  width: Get.width * 0.9,
                                                  // height: Get.height * 0.3,
                                                  height: 200,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  child: Image.network(
                                                      snapshot.data!.data![index].gallery!.isEmpty 
                                                      ? ''
                                                      : snapshot.data?.data?[index].gallery?.first.toString() ?? '',
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
                                                                Icons.preview_outlined,
                                                                color: Colors.grey.withOpacity(0.5),
                                                                size: 100,
                                                              )
                                                          ),
                                                        );
                                                      },
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
                                                            // snapshot.data?.data?[index].av ?? '',
                                                            '4.9',
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
                                                        snapshot.data?.data?[index].categoryId?.category ?? '',
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
                              ),
                            );
              
                          }
                    } else if(snapshot.hasError){
                          return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                    }  else {
                      return Container();
                   }
                }
              )
           
              :
              FutureBuilder<GetAllBusinessesByIslandsModel>(
                      future: exploreController.getBusinessesByIslands(widget.islandDetail?.sId.toString() ?? ''),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Loading'),
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
                                    Text(('No Place found')),
                                  ],
                                ),
                            );
                          }else {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.data!.businesses!.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() =>  IslandDetailsScreen(screenName: 'By Island', businessesByIsland: snapshot.data!.data!.businesses![index]));
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
                                                Container(
                                                  width: Get.width * 0.9,
                                                  // height: Get.height * 0.3,
                                                  height: 200,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  child: Image.network(
                                                      snapshot.data!.data!.businesses![index].gallery!.isEmpty 
                                                      ? ''
                                                      : snapshot.data?.data?.businesses?[index].gallery?.first.toString() ?? '',
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
                                                                Icons.preview_outlined,
                                                                color: Colors.grey.withOpacity(0.5),
                                                                size: 100,
                                                              )
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ),
                                                    
                                                // heart icon
                                                  Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      debugPrint('taap');
                                                       if (exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data!.businesses![index].sId!)) {
                                                        exploreController.unSavedBusinessApi(snapshot.data!.data!.businesses![index].sId!, SessionController().user?.data?.sId.toString() ?? '', false);
                                                      } else {
                                                        exploreController.savedBusinessApi(snapshot.data!.data!.businesses![index].sId!, SessionController().user?.data?.sId.toString() ?? '', true);
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 20, right: 20),
                                                      child: Obx(() =>
                                                        Icon(
                                                          Icons.favorite,
                                                          color: exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data!.businesses![index].sId!)
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
                                                            '4.9',
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
                                              snapshot.data?.data?.businesses?[index].name ?? '',
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
                                              snapshot.data?.data?.businesses?[index].address ?? '',
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
                                                        snapshot.data?.data?.businesses?[index].categoryId?.category ?? '',
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