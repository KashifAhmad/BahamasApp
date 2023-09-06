import 'package:awesome_scroller/awesome_scroller.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/feeds_tab_screens/add_feed_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/island_detail_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/controller/saved_business_controller.dart';
import 'package:bahamas/data/models/get_business_feed_model.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class BusinessFeedsTabScreen extends StatefulWidget {
  const BusinessFeedsTabScreen({super.key});

  @override
  State<BusinessFeedsTabScreen> createState() => _BusinessFeedsTabScreenState();
}

class _BusinessFeedsTabScreenState extends State<BusinessFeedsTabScreen> {

  SavedBusinessController controller = Get.put(SavedBusinessController());
  int pageIndex = 0;

  List imageList = [Constant.feedsImage, Constant.feedsImage1, Constant.feedsImage2, Constant.cabbageBeachFullSizeImage];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: FutureBuilder<GetBusinessFeedsModel>(
                      future: controller.getAllBusinessFeedApi(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const Text('Loading');
                          // return const SavedBusinessShimmerWidget();
                        }else if(snapshot.hasData){
                          if(snapshot.data!.message == 'Error During Communication No Internet Connection'){
                            return const Text(('No internet connect'));
                          } else if(snapshot.data?.data.toString() == 'null'){
                            return const SafeArea(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(('No business feed found')),
                                  ],
                                ),
                            );
                          }else {
                            return AwesomeScroller (
                            itemCount: snapshot.data!.data!.length,
                            scrollDirection: Axis.vertical,
                            onPageChanged: (index) {
                              setState(() {
                                pageIndex = index;
                                debugPrint(index.toString());
                              });
                            },
                            widget: Stack(
                              children: [
                                Stack(
                                  children: 
                                    [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              snapshot.data?.data?[pageIndex].images?[0] ?? ''
                                            )
                                          )
                                        )
                                      ),
                                      Column(
                                        children: [
                                          const Spacer(),
                                          Image.asset(
                                            Constant.feedsBottomBlackShade
                                          ),
                                        ],
                                      )
                                  ]
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Feeds",
                                              textAlign: TextAlign.center,
                                              style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
                                                fontFamily: AppTextTheme.ttHovesDemiBold,
                                                color: AppTextTheme.white
                                              ) 
                                            ),
                                            const Spacer(),
                                            Visibility(
                                              visible: SessionController().user!.data!.profileType == 'Business' ? true : false,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(() => const AddFeedsScreen());
                                                },
                                                child: Image.asset(
                                                  Constant.addFeedsIcon,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                                  visible: SessionController().user!.data!.profileType == 'Business' ? false : true,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Image.asset(
                                                        Constant.heartIcon,
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                ),              
                                          
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.65,
                                              child: Text(
                                                "See what businesses are posting near you",
                                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                  fontFamily: AppTextTheme.ttHovesMedium,
                                                  color: AppTextTheme.white.withOpacity(0.6)
                                                ) 
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 30),
                                              child: Visibility(
                                                visible: SessionController().user!.data!.profileType == 'Business' ? false : true,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      debugPrint('shareeee tab');
                                                      Share.share(
                                                        'check out my website https://example.com',
                                                        subject: 'Look what I made!'
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      Constant.shareIconIcon,
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                  ),
                                              ),
                                            )                 
                                          
                                          ],
                                        ),
                                      ),
                                      const Spacer(),              
                                      // rating
                                      SizedBox(
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
                                                  double.parse(snapshot.data?.data?[pageIndex].businessId?.averageRating.toString() ?? '0.0').toString(),
                                                  // '0',
                                                  style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
                                                  decoration: TextDecoration.none,
                                                    fontFamily: AppTextTheme.ttHovesMedium,
                                                    color: AppTextTheme.color2D2D33,
                                                  )
                                                )
                                              ],
                                            )
                                            ),
                                          ],
                                        ),
                                      ),
                                    const SizedBox(height: 5),
                                      // cafe name
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: GestureDetector(
                                          onTap: () => Get.to(() =>  IslandDetailsScreen(businessFeed: snapshot.data?.data?[pageIndex], screenName: 'Business Feed')),
                                          child: Text(
                                            snapshot.data?.data?[pageIndex].businessId?.name ?? '',
                                            // 'Café Matisse',
                                            style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
                                              decoration: TextDecoration.none,
                                              fontFamily: AppTextTheme.ttHovesMedium,
                                              color: AppTextTheme.white,
                                            )
                                          ),
                                        ),
                                      ),                          
                                      // cafe location
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.65,
                                              child: Text(
                                                snapshot.data?.data?[pageIndex].businessId?.address ?? '',
                                                // 'One Casino Drive, Suite 42, New Providence, The Bahamas',
                                                style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                                decoration: TextDecoration.none,
                                                  fontFamily: AppTextTheme.ttHovesMedium,
                                                  color: AppTextTheme.white.withOpacity(0.6),
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
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
                                                  snapshot.data?.data?[pageIndex].businessId?.categoryId?.category ?? '',
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
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 40), 
                                  ],
                                ),
                              ),
                            ]
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
                     
    );
  }
}