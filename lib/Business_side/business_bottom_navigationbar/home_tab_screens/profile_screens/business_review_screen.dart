import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/Utils/extensions.dart';
import 'package:bahamas/data/controller/profile_controller.dart';
import 'package:bahamas/data/models/user_review_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BusinessReviewsScreen extends StatefulWidget {
  const BusinessReviewsScreen({super.key});

  @override
  State<BusinessReviewsScreen> createState() => _BusinessReviewsScreenState();
}

class _BusinessReviewsScreenState extends State<BusinessReviewsScreen> {

  ProfileController profileController = Get.find();

  List reviewList = [
    {'Name': 'Julia Berlin', 'Date': 'Aug 11', 'Image': Constant.juliaImage},
    {'Name': 'Jennifer Smith', 'Date': 'Aug 10 ', 'Image': Constant.jenniferImage},
    // {'Name': 'Julia Berlin', 'Date': 'June 11', 'Image': Constant.juliaImage},
    // {'Name': 'Jennifer Smith', 'Date': 'May 28', 'Image': Constant.jenniferImage},
    // {'Name': 'Julia Berlin', 'Date': 'June 11', 'Image': Constant.juliaImage},
    // {'Name': 'Jennifer Smith', 'Date': 'May 28', 'Image': Constant.jenniferImage},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
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
                    SessionController().user!.data!.profileType == 'User' ? "My Reviews" : 'Reviews',
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
                    'Reviews given to your business by users are listed below',
                    style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontFamily: AppTextTheme.ttHovesMedium,
                      color: AppTextTheme.color2D2D33.withOpacity(0.50)
                    )
                  ),
                ),
            
                SizedBox(height: Get.height * 0.05),
                // SizedBox(
                //           width: Get.width * 0.9,
                //           child: ListView.builder(
                //             itemCount: reviewList.length,
                //             shrinkWrap: true,
                //             physics: const NeverScrollableScrollPhysics(),
                //             padding: const EdgeInsets.all(0),
                //             itemBuilder: (BuildContext context, int index) {
                //               return Padding(
                //                 padding: const EdgeInsets.only(bottom: 20),
                //                 child: Container(
                //                         width: Get.width * 0.6,
                //                         decoration: BoxDecoration(
                //                           color: AppTextTheme.colorFFFBE9,
                //                           border: Border.all(
                //                             width: 1,
                //                             color: AppTextTheme.colorF9EFC0,
                //                           ),
                //                           borderRadius: BorderRadius.circular(9.0)
                //                         ),
                //                         child: Column(
                //                           children: [
                //                             SizedBox(height: Get.height * 0.02),    
                //                             // profile image, name and daate container
                //                             SizedBox(
                //                               width: Get.width * 0.8,
                //                               child: Row(
                //                                 children: [
                //                                   Container(
                //                                     decoration: BoxDecoration(
                //                                       color: AppTextTheme.colorF9EFC0,
                //                                       borderRadius: BorderRadius.circular(10.0)
                //                                     ),
                //                                     child: Image.asset(
                //                                       reviewList[index]['Image'],
                //                                       // Constant.juliaImage,
                //                                       height: 40,
                //                                       width: 40,
                //                                       fit: BoxFit.fill,
                //                                     ),
                //                                   ),
                //                                   const SizedBox(width: 10),
                //                                   SizedBox(
                //                                     width: Get.width * 0.4,
                //                                     child: Text(
                //                                       reviewList[index]['Name'],
                //                                       // 'Julia Berlin',
                //                                       style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                //                                         decoration: TextDecoration.none,
                //                                         fontFamily: AppTextTheme.ttHovesMedium,
                //                                         color: AppTextTheme.color2D2D33,
                //                                       )
                //                                     ),
                //                                   ),
                //                                   const Spacer(),
                //                                   Text(
                //                                     reviewList[index]['Date'],
                //                                     // 'May 28',
                //                                     style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                //                                       decoration: TextDecoration.none,
                //                                       fontFamily: AppTextTheme.ttHovesRegular,
                //                                       color: AppTextTheme.color6D7076,
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                             SizedBox(height: Get.height * 0.005),
                //                             SizedBox(
                //                               width: Get.width * 0.8,
                //                               height: 30,
                //                               child: ListView.builder(
                //                                 itemCount: 5,
                //                                 shrinkWrap: true,
                //                                 scrollDirection: Axis.horizontal,
                //                                 itemBuilder: (context, index) {
                //                                   return Padding(
                //                                     padding: const EdgeInsets.only(right: 3.0),
                //                                     child: Image.asset(
                //                                       Constant.ratingStarIcon,
                //                                       height: 12,
                //                                       width: 12,
                //                                     ),
                //                                   );
                //                                 }
                //                               )
                //                             ),
                //                             SizedBox(height: Get.height * 0.005),
                //                             SizedBox(
                //                               width: Get.width * 0.8,
                //                               child: Text(
                //                                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                //                                     style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                //                                       decoration: TextDecoration.none,
                //                                       fontFamily: AppTextTheme.ttHovesRegular,
                //                                       color: AppTextTheme.color828898,
                //                                     )
                //                               ),
                //                             ),
                //                             SizedBox(height: Get.height * 0.02),
                //                           ],
                //                         ),
                //                       ),
                //               );
                //             }
                //   ),
                // ),
                
                FutureBuilder<GetUserReviewModel>(
                  future: profileController.getReviewApi(SessionController().user?.data?.sId ?? '') ,
                  builder: (context, snapshot){
                    // debugPrint(snapshot.data?.data?.length.toString());
                    // debugPrint(snapshot.data?.data?[0].businessId.name.toString());
                    if(!snapshot.hasData){
                      // return const Center(
                      //   child: CircularProgressIndicator()
                      // );
                      return MyReviewShimmerWidget(reviewList: reviewList);
                    }else if(snapshot.hasData){
                      if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                        return const Text(('No internet connect'));
                      } else if(snapshot.data!.data.toString() == 'null' || snapshot.data!.data!.isEmpty){
                        return const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(('No review yet')),
                            ],
                          ),
                        );
                      }else {
                        return Expanded(
                         child: SizedBox(
                          width: Get.width * 0.9,
                          child: ListView.builder(
                            itemCount: snapshot.data?.data?.length,
                            shrinkWrap: true,
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
                                                          snapshot.data?.data?[index].userId.image ?? '',
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
                                                      snapshot.data?.data?[index].userId.fullName ?? '',
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
                                                    snapshot.data!.data![index].date.covnertDateFormat(),
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
                                            // SizedBox(
                                            //   width: Get.width * 0.8,
                                            //   height: 30,
                                            //   child: ListView.builder(
                                            //     itemCount: 5,
                                            //     shrinkWrap: true,
                                            //     scrollDirection: Axis.horizontal,
                                            //     itemBuilder: (context, index) {
                                            //       return Padding(
                                            //         padding: const EdgeInsets.only(right: 3.0),
                                            //         child: Image.asset(
                                            //           Constant.ratingStarIcon,
                                            //           height: 12,
                                            //           width: 12,
                                            //         ),
                                            //       );
                                            //     }
                                            //   )
                                            // ),
                                           
                                            SizedBox(
                                              width: Get.width * 0.81,
                                              child: RatingBarIndicator(
                                                  rating: double.parse(snapshot.data!.data![index].ratingStars.toString()),
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
                                                snapshot.data?.data?[index].businessId.name ?? '',
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
                                                    snapshot.data?.data?[index].comments ?? '',
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
                        );
                      }
                    }else if(snapshot.hasError){
                      return Text(snapshot.error.toString() , style: TextStyle(fontSize: 18 , fontFamily: AppTextTheme.ttHovesBold));
                    }else {
                      return Container();
                    }
              }),

                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyReviewShimmerWidget extends StatelessWidget {
  const MyReviewShimmerWidget({
    super.key,
    required this.reviewList,
  });

  final List reviewList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
     child: SizedBox(
      width: Get.width * 0.9,
      child: ListView.builder(
        itemCount: reviewList.length,
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
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Row(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTextTheme.colorF9EFC0,
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Image.asset(
                                      Constant.juliaImage,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    '---------',
                                    // 'Julia Berlin',
                                    style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesMedium,
                                      color: AppTextTheme.color2D2D33,
                                    )
                                  ),
                                ),
                                const Spacer(),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Text(
                                    '----',
                                    // 'May 28',
                                    style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                      decoration: TextDecoration.none,
                                      fontFamily: AppTextTheme.ttHovesRegular,
                                      color: AppTextTheme.color6D7076,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.005),
                        SizedBox(
                          width: Get.width * 0.8,
                          height: 30,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: Image.asset(
                                    Constant.ratingStarIcon,
                                    height: 12,
                                    width: 12,
                                  ),
                                );
                              }
                            ),
                          )
                        ),
                        SizedBox(height: Get.height * 0.005),
                        SizedBox(
                          width: Get.width * 0.8,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Text(
                                  '---------------------------------------------------------',
                                  style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
                                    decoration: TextDecoration.none,
                                    fontFamily: AppTextTheme.ttHovesRegular,
                                    color: AppTextTheme.color828898,
                                  )
                            ),
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
                
    );
  }
}