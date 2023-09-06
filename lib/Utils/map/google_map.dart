// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/Utils/map/map_app_bar.dart';
import 'package:bahamas/Utils/map/place_search_model.dart';
import 'package:bahamas/Utils/map/search_field_map.dart';
import 'package:bahamas/data/controller/business_profile_controller.dart';
import 'package:bahamas/data/network/NetworkApiService.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:sizer/sizer.dart';

class GoogleMapClass extends StatefulWidget {
  final String placeName;
  const GoogleMapClass({
    Key? key,
    this.placeName = '',
  }) : super(key: key);
  @override
  _GoogleMapClassState createState() => _GoogleMapClassState();
}

class _GoogleMapClassState extends State<GoogleMapClass> {


  TextEditingController addresstxt = TextEditingController();
  TextEditingController searchText = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;
  String googleMapKey = 'AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg';
  List<PlaceSearch> searchResults = [];
  bool clear = false;

  BusinessProfileController controller = Get.find();
  // String locationError = '';
  // https://maps.googleapis.com/maps/api/place/autocomplete/json?input=lah&key=AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg
// https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJ2QeB5YMEGTkRYiR-zGy-OsI&key=AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg
// %2Crating%2Cformatted_phone_number&place_id=ChIJ2QeB5YMEGTkRYiR-zGy-OsI&key=YOUR_API_KEY
  MapType mapType = MapType.normal;
  final Set<Marker> _markers = {};
  bool loadingInd = false;
  bool gettingCurrentLocation = false;
  bool gettingDistance = false;
  bool gettingPlaceName = false;
  bool confirm = false;

  bool searching = false;

  LatLng _center = const LatLng(33.6295, 73.1170);
  var selectedPlaceName = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setInitPosition();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // mapController!.dispose();
  }

  void _setInitPosition() async {
    gettingCurrentLocation = true;
    _center = LatLng(SessionController().lat ?? 25.025885, SessionController().lon ?? -78.035889);
    debugPrint("********Current Location3*************");
    debugPrint("Current Location${_center.latitude} and ${_center.longitude}");
    debugPrint("********Current Location4*************");
    moveCamera(_center);
    setState(() {
      gettingCurrentLocation = false;
    });
  }

  Future<String> addressFromCorrdinates() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(_center.latitude, _center.longitude);
      debugPrint('on camera move end');
      (placemarks);
      Placemark place = placemarks[0];
      var address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      setState(() {
        addresstxt.text = address;
        SessionController().selectedLocation = addresstxt.text;
        SessionController().lat = _center.latitude;
        SessionController().lon = _center.longitude;

        debugPrint('***********************************************');
        debugPrint('latitude: ${_center.latitude}');
        debugPrint('longitude: ${_center.longitude}');
        debugPrint('***********************************************');
      });
      setState(() {});
      setState(() {});
      debugPrint('on camera move end');
      (address);
      return address;
    } catch (e) {
      debugPrint('Inside catch $e');
      rethrow;
    }
  }

  Future<void> moveCamera(LatLng center) async {
    mapController = await _controller.future;
    mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: center,
      zoom: 14.0,
    )));
  }

  Future onCameraMoveEnd() async {
    debugPrint('on camera move end');
    try {
      await addressFromCorrdinates();
      setState(() {
        loadingInd = false;
        gettingPlaceName = false;
      });
      if (confirm) {
        debugPrint('confirm');
        // _confirm();
      }
    } catch (e) {
      debugPrint('On CAMERA MOVE EXPCEPTION\n $e');
    }
  }

  void _onCameraMove(CameraPosition position) {
    debugPrint('on camera move');
    _center = position.target;
    setState(() {
      loadingInd = true;
    });
  }

  String strName = '';
  String street = '';
  double lat = 25.025885;
  double lng = -78.035889;
  void onSuggestionClick(Place placeDetails) {
    Constant.showDialog();
    setState(() {
      strName = placeDetails.streetNumber ?? '';
      street = placeDetails.street ?? '';
      lat = placeDetails.lat ?? 0.0;
      lng = placeDetails.lng ?? 0.0;
    });
    var center;
    setState(() {
      center = LatLng(lat, lng);
      SessionController().lat = lat;
      SessionController().lon = lng;
    });
    moveCamera(center);
    setState(() {
      searchText.clear();
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [ 
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAppBar(
                title: 'Add address',
                navBar: SearchField(
                  controller: searchText,
                  onPressed: () {
                    search(searchText.text);
                  },
                  enabled: widget.placeName != '' ? false : true,
                  key: null,
                  onChanged: (val) {
                    if (val.length > 1) {
                      search(searchText.text);
                    }
                    if (val.length < 2) {
                      setState(() {
                        searchResults.clear();
                      });
                    }
                  },
                ),
                onBackPressed: null,
                key: null,
              ),
        
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
              //   child: MapsPlacesAutocomplete(
              //     mapsApiKey: 'AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg',
              //     onSuggestionClick: onSuggestionClick,
              //     componentCountry: 'Pak',
              //     language: 'En',
              //     buildItem: (Suggestion suggestion, int index) {
              //       return Container(
              //           margin: const EdgeInsets.fromLTRB(2, 2, 2, 0),
              //           padding: const EdgeInsets.all(8),
              //           alignment: Alignment.centerLeft,
              //           color: Colors.white,
              //           child: Text(suggestion.description));
              //     },
              //     inputDecoration: const InputDecoration(
              //         contentPadding: EdgeInsets.all(8),
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.white)),
              //         hintText: "search",
              //         errorText: null),
              //     clearButton: const Icon(Icons.close),
              //   ),
              // ),
        
              gettingCurrentLocation
                  ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                  : Stack(
                    children: [ 
                      Column(
                        children: [ 
                        Stack(
                          children: [
                            SizedBox(
                              height: Get.height * 0.55,
                              width: Get.width,
                              child: GoogleMap(
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                                zoomControlsEnabled: widget.placeName != '' ? false : false,
                                myLocationButtonEnabled: false,
                                myLocationEnabled: widget.placeName != '' ? false : true,
                                markers: _markers,
                                zoomGesturesEnabled: widget.placeName != '' ? false : false,
                                mapToolbarEnabled: widget.placeName != '' ? false : true,
                                onCameraMove: _onCameraMove,
                                onCameraIdle: onCameraMoveEnd,
                                // onCameraMoveStarted: _onCameraMoveStarted,
                                initialCameraPosition: CameraPosition(
                                  target: _center,
                                  zoom: 17.0,
                                ),
                                mapType: mapType,
                                onTap: (center) {},
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 3.h),
                                    child: Image.asset(
                                        Constant.locationMarkerIcon,
                                        height: 15.h,
                                        fit: BoxFit.contain),
                                  )),
                            ),
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: Container(
                            //     height: Get.height * 0.9,
                            //     margin: EdgeInsets.only(bottom: 17.0.h, left: 8.0.w, right: 8.0.w),
                            //     padding: EdgeInsets.only(bottom: 0.0.h, left: 1.0.w, right: 1.0.w),
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(10)),
                            //     child: loadingInd == true
                            //         ? Container(
                            //             padding: EdgeInsets.only(
                            //                 bottom: 0.0.h,
                            //                 left: 1.0.w,
                            //                 right: 1.0.w),
                            //             height: 6.0.h,
                            //             child: const Center(
                            //               child: CircularProgressIndicator(
                            //                 color: Colors.orange,
                            //               ),
                            //             ),
                            //           )
                            //         : TextField(
                            //             controller: addresstxt,
                            //             enabled: false,
                            //             maxLines: null,
                            //             decoration: const InputDecoration(
                            //               border: InputBorder.none,
                            //             ),
                            //           ),
                            //   ),
                            // ),
                          ]
                        ),
                    
                        // widget.placeName != ''
                            //     ? Container(
                            //         height: double.infinity,
                            //         width: double.infinity,
                            //         color: Colors.black.withOpacity(0.1),
                            //         child: InkWell(
                            //           onTap: () {
                            //             Get.back(); //result: false
                            //           },
                            //           child: Align(
                            //             alignment: Alignment.bottomCenter,
                            //             child: Container(
                            //               margin: EdgeInsets.only(bottom: 4.5.h),
                            //               height: 5.0.h,
                            //               width: 70.w,
                            //               decoration: BoxDecoration(
                            //                   color: Colors.red.shade200,
                            //                   borderRadius: BorderRadius.circular(10)),
                            //               child: Center(
                            //                   child: Text(
                            //                 "Cancel",
                            //                 style: TextStyle(
                            //                     color: Colors.white,
                            //                     fontSize: 12.0.sp),
                            //               )),
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     : const SizedBox(),
                        ]
                      ),    
                    ]
                ),
                widget.placeName != ''
                ? const SizedBox()
                : gettingDistance || gettingPlaceName
                  ? Container(
                    width: 35.w,
                    height: 5.h,
                    margin: EdgeInsets.only(left: 5.w),
                    alignment: Alignment.center,
                    child: const Wrap(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  )
                  : InkWell(
                    onTap: () async {
                      if (addresstxt.text != '') {
                        setState(() {
                          SessionController().selectedLocation = addresstxt.text;
                          controller.businessAddressController.text = addresstxt.text;
                        });
                        debugPrint(SessionController().selectedLocation);
                        debugPrint('*****addresstxt.text*******');
                        debugPrint(addresstxt.text);
                        Get.back();
                      } else {
                          Constant.showSnackBar(
                            'Wait..',
                            'Please select location..'
                          );
                        }
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
                              'Continue',
                              style: AppTextTheme.lightTextTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.none,
                                fontFamily: AppTextTheme.ttHovesMedium,
                                color: AppTextTheme.color2D2D33
                              )
                            ),
                          ),
                        ),
                      ),
                  ),
                       
            ],
          ),
            searching
              ? Padding(
                padding: EdgeInsets.only(top: Get.width * 0.43),
                child: Align(
                   alignment: Alignment.topCenter,
                  child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                              width: double.infinity,
                              color: Colors.white,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Wrap(
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                ],
                            ),
                          ),
                ),
              )
              : searchResults.isEmpty
                ? const SizedBox()
                : Padding(
                  padding: EdgeInsets.only(top: Get.width * 0.43),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: AppTextTheme.colorABB2C4, width: 1.0)
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // gotoPlace(searchResults[index].description ?? '');
                              getPlaceDetail(searchResults[index].placeId ?? '');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: Get.width * 0.7,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Constant.discoverIcon,
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: Get.width * 0.6,
                                          child: Text(
                                            searchResults[index].description ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                // fontFamily: FontFamily.PangramBold700,
                                                height: Get.height * 0.002,
                                                color: Colors.black,
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ),
                      
          ]
        ),
      ),
    );
  }                   

  void search(String search) {
    
    if (search.isEmpty) {
      clear = true;
      setState(() {
        searchResults.clear();
      });
    } else {
      clear = false;
      getAutocomplete(search);
    }
  }

  Future getPlaceDetail(String placeID) async {
    Constant.showDialog();
    if (kDebugMode) {
      print('Place ID :$placeID');
    }
    clear = true;
    setState(() {
      searchResults.clear();
    });
    try {
      var url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg';

      var response = await NetworkApiService().getGetApiResponse(url);
      var location = response['result']['geometry']['location'];
      debugPrint(location['lat'].toString());
      debugPrint(location['lng'].toString());
      var center;
      setState(() {
        center = LatLng(location['lat'], location['lng']);
        SessionController().lat = location['lat'];
        SessionController().lon = location['lng'];
      });
      moveCamera(center);
      setState(() {
      searchText.clear();
      });
      Get.back();
    } catch (e) {
      debugPrint('Inside Catch :::::');
      clear = true;
      setState(() {
        searchText.clear();
      });
      Get.back();
      Get.snackbar('Error', 'Something went wrong');
      debugPrint(e.toString());
    }
  }

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&&components=country:bs&sensor=false&key=$googleMapKey';
    setState(() {
      searching = true;
    });
    var response = await get(url);
    setState(() {
      searching = false;
    });
    // if (clear) return null;
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    debugPrint(jsonResults.toString());
    var searchRes = jsonResults.map((place) {
      return PlaceSearch.fromJson(place);
    }).toList();

    setState(() {
      searchResults = searchRes;
    });
    debugPrint(searchResults.toString());
    return searchResults;
  }

  // void gotoPlace(String placeName) async {
  //   Constants.showDialog();
  //   if (kDebugMode) {
  //     print('Place Name :$placeName');
  //   }
  //   clear = true;
  //   setState(() {
  //     searchResults.clear();
  //   });
  //   try {
  //     List<Location> locations = await locationFromAddress(placeName);
  //     // ignore: prefer_typing_uninitialized_variables
  //     var center;
  //     setState(() {
  //       center = LatLng(locations[0].latitude, locations[0].longitude);
  //       SessionController().lat = locations[0].latitude;
  //       SessionController().lon = locations[0].longitude;
  //     });
  //     moveCamera(center);
  //     setState(() {
  //       searchText.clear();
  //     });
  //     Get.back();
  //   } catch (e) {
  //     debugPrint('Inside Catch :::::');
  //     clear = true;
  //     setState(() {
  //       searchText.clear();
  //     });
  //     Get.back();
  //     Get.back();
  //     Get.snackbar('Error', 'Some error occured please try again');
  //     debugPrint(e.toString());
  //   }
  // }

  static Future<dynamic> get(String url) async {
    debugPrint('url: $url');
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          //'Authorization': 'Bearer ${SessionController().getToken()}',
        },
      ).timeout(const Duration(seconds: 30));
      debugPrint('got response: ${response.statusCode}');
      // debugPrint(response.body);
      return _getResponse(response, url);
    } on SocketException {
      debugPrint('socket exception');
      return 'No internet connection';
    } on TimeoutException {
      debugPrint('timeout');
      return 'Connection timed out';
    }
  }

  static dynamic _getResponse(http.Response response, String url) {
    debugPrint('Status Code: ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        return response;
      default:
        return '${response.statusCode}: Something Went Wrong';
    }
  }
}
