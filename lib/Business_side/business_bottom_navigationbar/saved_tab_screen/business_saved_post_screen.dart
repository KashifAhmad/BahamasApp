import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/island_detail_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/explore_controller.dart';
import 'package:bahamas/data/models/get_user_detail_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BusinessSavedPostScreen extends StatefulWidget {
  const BusinessSavedPostScreen({super.key});

  @override
  State<BusinessSavedPostScreen> createState() => _BusinessSavedPostScreenState();
}

class _BusinessSavedPostScreenState extends State<BusinessSavedPostScreen> {

  // SavedBusinessController controller = Get.put(SavedBusinessController());
  ExploreController exploreController = Get.find();

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
                    Text(
                      'Saved business',
                      style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
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
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              FutureBuilder<GetSaveBusinessesModel>(
                  future: exploreController.getUserDetailWithBusiness(SessionController().user?.data?.sId ?? ''),
                  // future: exploreController.getSavedBusinesses(SessionController().user?.data?.sId ?? ''),
                  builder: (context, snapshot){
                    debugPrint(snapshot.data?.data?.length.toString());
                    if(!snapshot.hasData){
                      return const SavedBusinessShimmerWidget();
                    }else if(snapshot.hasData){
                      if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                        return const Text(('No internet connect'));
                      } else if(snapshot.data?.data.toString() == 'null' || snapshot.data!.data!.isEmpty || snapshot.data!.data == []){
                        return const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(('No saved business yet')),
                            ],
                          ),
                        );
                      }else {
                        return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            if(snapshot.data!.data![index].business != null) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    Get.to(() => IslandDetailsScreen(islandDetail: snapshot.data!.data![index], screenName: 'Saved Business',));
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
                                        snapshot.data!.data![index].business!.gallery!.isEmpty
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
                                                  snapshot.data!.data![index].business!.gallery!.first,
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
                                            // heart icon
                                            Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        debugPrint('taap');
                                                        if (exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index].business!.sId!)) {
                                                            exploreController.unSavedBusinessApi(snapshot.data!.data![index].business!.sId!, SessionController().user?.data?.sId.toString() ?? '', false);
                                                        } else {
                                                          exploreController.savedBusinessApi(snapshot.data!.data![index].business!.sId!, SessionController().user?.data?.sId.toString() ?? '', true);
                                                        }
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 20, right: 20),
                                                        child: Obx(() =>
                                                          Icon(
                                                            Icons.favorite,
                                                            color: exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index].business!.sId!)
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
                                                        snapshot.data?.data?[index].business!.avgRating.toString() ?? '3',
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
                                          snapshot.data?.data?[index].business!.name.toString() ?? ' ',
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
                                          snapshot.data?.data?[index].business!.address.toString() ?? ' ',
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
                                                    snapshot.data?.data?[index].business?.categoryId?.category.toString() ?? '',
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
                              
                            } else{
                              return const SizedBox();
                            }
                            // return Center(
                            //     child: GestureDetector(
                            //       onTap: () async {
                            //         Get.to(() => IslandDetailsScreen(islandDetail: snapshot.data!.data![index], screenName: 'Saved Business',));
                            //       },
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //         SizedBox(
                            //           width: Get.width * 0.9,
                            //           height: 200,
                            //           child: Stack(
                            //             alignment: Alignment.center,
                            //           children: [
                            //             snapshot.data!.data![index + 1].business!.gallery!.isEmpty
                            //             ?
                            //             Container(
                            //                   width: Get.width * 0.9,
                            //                   height: 200,
                            //                   clipBehavior: Clip.antiAlias,
                            //                   decoration: BoxDecoration(
                            //                     border: Border.all(width: 0.5, color: Colors.grey),
                            //                     borderRadius: BorderRadius.circular(10.0),
                            //                   ),
                            //                   // child: Image.asset(
                            //                   //   Constant.cabbageBeaachImage,
                            //                   //   fit: BoxFit.fill,
                            //                   // ),
                            //                   child: Center(
                            //                     child: Text(
                            //                       'No image found',
                            //                       style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                            //                         decoration: TextDecoration.none,
                            //                         fontFamily: AppTextTheme.ttHovesRegular,
                            //                         color: AppTextTheme.color2D2D33
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 )
                            //             :
                            //             SizedBox(
                            //                   width: Get.width * 0.9,
                            //                   height: 200,
                            //                   child: ClipRRect(
                            //                     borderRadius: BorderRadius.circular(16),
                            //                     child: Image.network(
                            //                       snapshot.data!.data![index + 1].business!.gallery!.first,
                            //                       fit: BoxFit.cover,
                            //                       width: Get.width * 0.9,
                            //                       height: 200,  
                            //                       loadingBuilder:
                            //                           (context, child, loadingProgress) {
                            //                         if (loadingProgress == null) {
                            //                           return child;
                            //                         }
                            //                         return Container(
                            //                           width: Get.width * 0.9,
                            //                           height: 200,
                            //                           color: Colors.grey.withOpacity(0.3),
                            //                           child: SizedBox(
                            //                               height: Get.height * 0.24,
                            //                               child: const Center(
                            //                                   child: CircularProgressIndicator()
                            //                             )
                            //                           ),
                            //                         );
                            //                       },
                            //                       errorBuilder:
                            //                           (context, child, loadingProgress) {
                            //                         return Padding(
                            //                           padding: const EdgeInsets.all(0.0),
                            //                           child: Container(
                            //                               width: Get.width * 0.9,
                            //                               height: 200,
                            //                               clipBehavior: Clip.antiAlias,
                            //                               decoration: BoxDecoration(
                            //                                   borderRadius:
                            //                                       BorderRadius.circular(16.0),
                            //                                   border: Border.all(
                            //                                       width: 0.5,
                            //                                       color: Colors.grey)
                            //                                   ),
                            //                               child: Icon(
                            //                                 Icons.person_2_outlined,
                            //                                 color: Colors.grey.withOpacity(0.5),
                            //                                 size: 50,
                            //                               )
                            //                           ),
                            //                         );
                            //                       },
                            //                     ),
                            //                   ),
                            //             ),
                            //                 // heart icon
                            //                 Positioned(
                            //                         top: 5,
                            //                         right: 5,
                            //                         child: GestureDetector(
                            //                           onTap: () {
                            //                             debugPrint('taap');
                            //                             if (exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index + 1].sId!)) {
                            //                               exploreController.unSavedBusinessApi(snapshot.data!.data![index + 1].sId!, SessionController().user?.data?.sId.toString() ?? '', false);
                            //                             } else {
                            //                               exploreController.savedBusinessApi(snapshot.data!.data![index + 1].sId!, SessionController().user?.data?.sId.toString() ?? '', true);
                            //                             }
                            //                           },
                            //                           child: Padding(
                            //                             padding: const EdgeInsets.only(top: 20, right: 20),
                            //                             child: Obx(() =>
                            //                               Icon(
                            //                                 Icons.favorite,
                            //                                 color: exploreController.allSavedBusinessIdsList.contains(snapshot.data!.data![index + 1].sId!)
                            //                                 ? Colors.red
                            //                                 : Colors.white,
                            //                                 size: 24
                            //                               ),
                            //                             )
                            //                           )
                            //                         ),
                            //                       ),                 
                            //                 // rating
                            //                 Positioned(
                            //                   left: 2,
                            //                   bottom: 5,
                            //                   child: Padding(
                            //                     padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                            //                     child: Container(
                            //                       width: 78,
                            //                       height: 34,
                            //                       decoration: BoxDecoration(
                            //                         color: AppTextTheme.colorFEF8DC,
                            //                         borderRadius: BorderRadius.circular(8.0)
                            //                       ),
                            //                       child: Row(
                            //                         mainAxisAlignment: MainAxisAlignment.center,
                            //                         children: [
                            //                           Image.asset(
                            //                             Constant.ratingStarIcon,
                            //                             height: 18,
                            //                             width: 18,
                            //                           ),
                            //                           SizedBox(width: Get.width * 0.025),
                            //                           Text(
                            //                             snapshot.data?.data?[index + 1].business!.avgRating.toString() ?? '3',
                            //                             // '4.9',
                            //                             style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                            //                               decoration: TextDecoration.none,
                            //                               fontFamily: AppTextTheme.ttHovesMedium,
                            //                               color: AppTextTheme.color2D2D33,
                            //                             )
                            //                           )
                            //                         ],
                            //                       )
                            //                     ),
                            //                   ),
                            //                 )
                            //               ]
                            //             ),
                            //           ),
                            //         const SizedBox(height: 10),
                            //         SizedBox(
                            //             width: Get.width * 0.8,
                            //             child: Text(
                            //               snapshot.data?.data?[index + 1].business!.name.toString() ?? ' ',
                            //               // 'Atlantis New Providence',
                            //               style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                            //                 decoration: TextDecoration.none,
                            //                 fontFamily: AppTextTheme.ttHovesMedium,
                            //                 color: AppTextTheme.color2D2D33,
                            //               )
                            //             ),
                            //           ),
                            //         const SizedBox(height: 2),
                            //         SizedBox(
                            //             width: Get.width * 0.8,
                            //             child: Text(
                            //               snapshot.data?.data?[index + 1].business!.address.toString() ?? ' ',
                            //               // 'Four Season Resort - New Providence',
                            //               style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                            //                 decoration: TextDecoration.none,
                            //                 fontFamily: AppTextTheme.ttHovesMedium,
                            //                 color: AppTextTheme.color828898,
                            //               )
                            //             ),
                            //           ),
                            //           const SizedBox(height: 15),
                            //           SizedBox(
                            //             width: Get.width * 0.9,
                            //             child: Row(
                            //               children: [
                            //                 Container(
                            //                   decoration: BoxDecoration(
                            //                     color: AppTextTheme.colorF3F3F3,
                            //                     borderRadius: BorderRadius.circular(8.0)
                            //                   ),
                            //                   child: Center(
                            //                     child: Padding(
                            //                       padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                            //                       child: Text(
                            //                         islandsSubList[index + 1]['Place'],
                            //                         // 'Hotel & Restaurant',
                            //                         style: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
                            //                           decoration: TextDecoration.none,
                            //                           fontFamily: AppTextTheme.ttHovesMedium,
                            //                           color: AppTextTheme.color2D2D33,
                            //                         )
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ), 
                            //           SizedBox(height: Get.height * 0.03),
                            //         ],
                            //       ),
                            //     ),
                            //   );    
                          
                          }
                        ),
                      );
                      }
                    }else if(snapshot.hasError){
                      return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                    }else {
                      return Container();
                    }
              }),
        
            ],
          ),
        ),
      ),
    );
  }
}


class SavedBusinessShimmerWidget extends StatelessWidget {
  const SavedBusinessShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(() => const IslandDetailsScreen());
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
                                              child: Image.asset(
                                                fit: BoxFit.fill,
                                                Constant.atlantisImage,
                                              ),
                                            ),                   
                                            // heart icon
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: GestureDetector(
                                                onTap: () {
                                                  debugPrint('taap');
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 20, right: 20),
                                                  child: Image.asset(
                                                    Constant.filledHeartIcon,
                                                    width: 28,
                                                    height: 22,
                                                  ),
                                                ),
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
                                                        '',
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
                                          '',
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
                                          '',
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
                                                    'Hotel & Restaurant',
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
                              ),
                            );    
                          }
                        ),
                      );
                      
  }
}