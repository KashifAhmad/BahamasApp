import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {

  String dropDownValue = 'Monthly';
  List<String> cityList = [
    'Monthly',
    'Yearly',
  ];

   List reviewList = [
    {'Name': 'Julia Berlin', 'Date': 'June 11', 'Image': Constant.juliaImage},
    {'Name': 'Jennifer Smith', 'Date': 'May 28', 'Image': Constant.jenniferImage},
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          // child: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       SizedBox(height: Get.height * 0.03),
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             Text(
          //               'Business Analytics',
          //               style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(
          //                 decoration: TextDecoration.none,
          //                 fontFamily: AppTextTheme.ttHovesDemiBold,
          //                 color: AppTextTheme.color2D2D33
          //               ),
          //             ),
          //             const Spacer(),
          //             Image.asset(
          //               Constant.notificationStatusIcon,
          //               height: 25,
          //               width: 25,
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 10), 
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                 color: AppTextTheme.colorFEF8DC,
          //                 borderRadius: BorderRadius.circular(8)
          //               ),
          //               child: Padding(
          //                   padding: const EdgeInsets.all(10.0),
          //                   child: Text(
          //                     'Free trail for 30 days',
          //                     style: AppTextTheme.lightTextTheme.headlineMedium!.copyWith(
          //                     decoration: TextDecoration.none,
          //                     fontFamily: AppTextTheme.ttHovesMedium,
          //                     color: AppTextTheme.color2D2D33
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 30), 
          
          //       // profile views and total reviews
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             SizedBox(
          //               width: Get.width * 0.43,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   border: Border.all(
          //                     width: 1,
          //                     color: AppTextTheme.colorABB2C4
          //                   ),
          //                   borderRadius: BorderRadius.circular(10.0)
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     const SizedBox(height: 15),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 10),
          //                       child: FittedBox(
          //                         fit: BoxFit.scaleDown,
          //                         child: Text(
          //                           'Total profile views',
          //                           style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                             decoration: TextDecoration.none,
          //                             fontFamily: AppTextTheme.ttHovesDemiBold,
          //                             color: AppTextTheme.color828898
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 10, top: 5),
          //                       child: FittedBox(
          //                         fit: BoxFit.scaleDown,
          //                         child: Text(
          //                           '40290',
          //                           style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
          //                             decoration: TextDecoration.none,
          //                             fontFamily: AppTextTheme.ttHovesDemiBold,
          //                             color: AppTextTheme.color2D2D33
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     const SizedBox(height: 10),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             const Spacer(),
          //             SizedBox(
          //               width: Get.width * 0.43,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   border: Border.all(
          //                     width: 1,
          //                     color: AppTextTheme.colorABB2C4
          //                   ),
          //                   borderRadius: BorderRadius.circular(10.0)
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     const SizedBox(height: 15),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 10),
          //                       child: FittedBox(
          //                         fit: BoxFit.scaleDown,
          //                         child: Text(
          //                           'Total reviews',
          //                           style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                             decoration: TextDecoration.none,
          //                             fontFamily: AppTextTheme.ttHovesDemiBold,
          //                             color: AppTextTheme.color828898
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 10, top: 5),
          //                       child: FittedBox(
          //                         fit: BoxFit.scaleDown,
          //                         child: Text(
          //                           '290',
          //                           style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(
          //                             decoration: TextDecoration.none,
          //                             fontFamily: AppTextTheme.ttHovesDemiBold,
          //                             color: AppTextTheme.color2D2D33
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     const SizedBox(height: 10),
          //                   ],
          //                 ),
          //               ),
          //             ),
                    
          //           ],
          //         ),
          //       ),
          
          //       // seprator
          //       const SizedBox(height: 30),
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Container(
          //           height: 2,
          //           decoration: BoxDecoration(
          //             color: AppTextTheme.black.withOpacity(0.10)
          //           ),
          //         ),
          //       ),
          
          //       // select month, day
          //       const SizedBox(height: 20),
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Analytics',
          //                   style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                     fontFamily: AppTextTheme.ttHovesMedium,
          //                     color: AppTextTheme.color828898
          //                   ),
          //                 ),
          //                 Text(
          //                   'June, 2023',
          //                   style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
          //                     fontFamily: AppTextTheme.ttHovesMedium,
          //                     color: AppTextTheme.color2D2D33
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const Spacer(),
          //             SizedBox(
          //             width: Get.width * 0.35,
          //             child: DropdownButtonFormField(
          //                 icon: const Icon(Icons.keyboard_arrow_down_rounded),
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(color: AppTextTheme.colorABB2C4, width: 1),
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(color: AppTextTheme.color2D2D33, width: 1),
          //                     borderRadius: BorderRadius.circular(10.0),
          //                   ), 
                              
          //                   // hintStyle: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
          //                   //   decoration: TextDecoration.none,
          //                   //   fontFamily: AppTextTheme.ttHovesMedium,
          //                   //   color: AppTextTheme.color2D2D33.withOpacity(0.30),
          //                   // ),
          //                   // hintText: "Select business",
          //                   fillColor: Colors.white
          //                 ),
          //                 value: dropDownValue,
          //                 onChanged: (String? value) {
          //                   setState(() {
          //                     dropDownValue = value!;
          //                   });
          //                 },
          //                 items: cityList
          //                     .map((cityTitle) => DropdownMenuItem(
          //                         value: cityTitle, child: Text(cityTitle)))
          //                     .toList(),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 30),
          //       Center(
          //         child: SfCartesianChart(
          //           // Initialize category axis
          //           primaryXAxis: CategoryAxis(),
          //           enableSideBySideSeriesPlacement: false,
          //           series: <LineSeries<SalesData, String>>[
          //             LineSeries<SalesData, String>(
          //               color: AppTextTheme.colorF8D20F,
          //               // Bind data source
          //               dataSource:  <SalesData>[
          //                 SalesData('Jan', 200),
          //                 SalesData('Feb', 400),
          //                 SalesData('Mar', 600),
          //                 SalesData('Apr', 1000),
          //                 SalesData('May', 750)
          //               ],
          //               xValueMapper: (SalesData sales, _) => sales.year,
          //               yValueMapper: (SalesData sales, _) => sales.sales
          //             ),
          //             LineSeries<SalesData, String>(
          //               color: AppTextTheme.color2D2D33,
          //               // markerSettings: MarkerSettings(
          //               //   isVisible: true,
          //               //   color: AppTextTheme.color2D2D33,
          //               // ),
          //               //  dataLabelSettings: DataLabelSettings(
          //               //   isVisible: true,
          //               //   color: AppTextTheme.color2D2D33,
          //               // ),
          //               // emptyPointSettings: EmptyPointSettings(
          //               //   color: Colors.red
          //               // ),
          //               // Bind data source
          //               dataSource:  <SalesData>[
          //                 SalesData('Jan', 300),
          //                 SalesData('Feb', 200),
          //                 SalesData('Mar', 440),
          //                 SalesData('Apr', 500),
          //                 SalesData('May', 150)
          //               ],
          //               xValueMapper: (SalesData sales, _) => sales.year,
          //               yValueMapper: (SalesData sales, _) => sales.sales
          //             )
          //           ]
          //         )
          //       ),
          //       const SizedBox(height: 20),
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             const Spacer(),
          //             Container(
          //               height: 20,
          //               width: 20,
          //               decoration: BoxDecoration(
          //                 color: AppTextTheme.colorF8D20F,
          //                 shape: BoxShape.circle
          //               ),
          //             ),
          //             const SizedBox(width: 15),
          //             Text(
          //               'Views',
          //               style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                 fontFamily: AppTextTheme.ttHovesMedium,
          //                 color: AppTextTheme.color828898
          //               ),
          //             ),
          //             const SizedBox(width: 40),
          //             Container(
          //               height: 20,
          //               width: 20,
          //               decoration: BoxDecoration(
          //                 color: AppTextTheme.color3B3B40,
          //                 shape: BoxShape.circle
          //               ),
          //             ),
          //             const SizedBox(width: 15),
          //             Text(
          //               'Ratings',
          //               style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                 fontFamily: AppTextTheme.ttHovesMedium,
          //                 color: AppTextTheme.color828898
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 30),
          //       Container(
          //         height: 1,
          //         width: Get.width * 0.9,
          //         decoration: BoxDecoration(
          //           color: AppTextTheme.black.withOpacity(0.10)
          //         ),
          //       ),
          //       const SizedBox(height: 30),
          //       SizedBox(
          //         width: Get.width * 0.9,
          //         child: Row(
          //           children: [
          //             Text(
          //               'Summary',
          //               style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
          //                 fontFamily: AppTextTheme.ttHovesMedium,
          //                 color: AppTextTheme.color2D2D33
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 20),
          //        SizedBox(
          //               width: Get.width * 0.9,
          //               child: ListView.builder(
          //                 itemCount: reviewList.length,
          //                 shrinkWrap: true,
          //                 physics: const NeverScrollableScrollPhysics(),
          //                 padding: const EdgeInsets.all(0),
          //                 itemBuilder: (BuildContext context, int index) {
          //                   return Column(
          //                     children: [
          //                       // profile image, name and daate container
          //                       SizedBox(
          //                         width: Get.width * 0.9,
          //                         child: Row(
          //                           children: [
          //                             Container(
          //                               decoration: BoxDecoration(
          //                                 color: AppTextTheme.colorF9EFC0,
          //                                 borderRadius: BorderRadius.circular(10.0)
          //                               ),
          //                               child: Image.asset(
          //                                 reviewList[index]['Image'],
          //                                 // Constant.juliaImage,
          //                                 height: 50,
          //                                 width: 50,
          //                                 fit: BoxFit.fill,
          //                               ),
          //                             ),
          //                             const SizedBox(width: 10),
          //                             SizedBox(
          //                               width: Get.width * 0.4,
          //                               child: Column(
          //                                 crossAxisAlignment: CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     reviewList[index]['Name'],
          //                                     // 'Julia Berlin',
          //                                     style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                                       decoration: TextDecoration.none,
          //                                       fontFamily: AppTextTheme.ttHovesMedium,
          //                                       color: AppTextTheme.color2D2D33,
          //                                     )
          //                                   ),
          //                                    Text(
          //                                     '11 June, 2023',
          //                                     style: AppTextTheme.lightTextTheme.headlineLarge!.copyWith(
          //                                           decoration: TextDecoration.none,
          //                                           fontFamily: AppTextTheme.ttHovesRegular,
          //                                           color: AppTextTheme.color6D7076,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             const Spacer(),
          //                             RatingBarIndicator(
          //                                 rating: 5,
          //                                 itemBuilder: (context, index) => const Icon(
          //                                     Icons.star,
          //                                     color: Colors.amber,
          //                                 ),
          //                                 itemCount: 5,
          //                                 itemSize: 20.0,
          //                                 direction: Axis.horizontal,
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       SizedBox(height: Get.height * 0.02),
          //                        Container(
          //                         height: 1,
          //                         width: Get.width * 0.9,
          //                         decoration: BoxDecoration(
          //                           color: AppTextTheme.black.withOpacity(0.10)
          //                         ),
          //                       ),
          //                       SizedBox(height: Get.height * 0.025),
          //                     ],
          //                   );
          //                 }
          //               ),
          //             ),
          //     ],
          //   ),
          // ),
          child: Text('Coming soon!'),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}