import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Constant {
  
  static showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.white70,
        titleText: Text(
          title,
          style: TextStyle(fontFamily: AppTextTheme.ttHovesBold, fontSize: 14),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontFamily: AppTextTheme.ttHovesMedium, fontSize: 14),
        ));
  }

  static showDialog() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
    );
  }

  // URL launcher
  static launchURL(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // Logo Paths
  static String logo = 'assets/logo/';
  static String splashLogo = '${logo}splash_logo.png';

  // Icons Paths
  static String icons = 'assets/icons/';
  static String fbIcon = '${icons}fb_icon.png';
  static String backArrowIcon = '${icons}back_arrow.png';
  static String heartIcon = '${icons}heart_icon.png';
  static String boatingIcon = '${icons}boating_icon.png';
  static String cafeIcon = '${icons}cafe_icon.png';
  static String casinoIcon = '${icons}casino_icon.png';
  static String dropdownIcon = '${icons}dropdown_icon.png';
  static String educationIcon = '${icons}education_icon.png';
  static String forwordArrowIcon = '${icons}forword_arrow.png';
  static String googleIcon = '${icons}google_icon.png';
  static String hotelIcon = '${icons}hotel_icon.png';
  static String nightlifeIcon = '${icons}nightlife_icon.png';
  static String notificationStatusIcon = '${icons}notification_status.png';
  static String playAreaIcon = '${icons}playarea_icon.png';
  static String ratingStarIcon = '${icons}rating_star.png';
  static String restaurantIcon = '${icons}restaurant_icon.png';
  static String searchIcon = '${icons}search_icon.png';
  static String arrow45Icon = '${icons}arrow45-icon.png';
  static String facebookIcon = '${icons}facebook_icon.png';
  static String globeIcon = '${icons}globe_icon.png';
  static String instagramIcon = '${icons}instagram_icon.png';
  static String mapviewIcon = '${icons}mapview_icon.png';
  static String radarIcon = '${icons}radar_icon.png';
  static String whatsappIcon = '${icons}whatsapp_icon.png';
  static String whitestarIcon = '${icons}whitestar_icon.png';
  static String feedTabIcon = '${icons}feedTab_icon.png';
  static String exploreTabIcon = '${icons}exploreTab_icon.png';
  static String analyticsTabIcon = '${icons}analyticsTab_icon.png';
  static String profileTabIcon = '${icons}profileTab_icon.png';
  static String savedTabIcon = '${icons}savedTab_icon.png';
  static String filledHeartIcon = '${icons}filled_heart_icon.png';
  static String aboutUsIicon = '${icons}about_us_icon.png';
  static String businessReviewsIcon = '${icons}business_reviews_icon.png';
  static String changepasswordIcon = '${icons}change_password_icon.png';
  static String deleteBusinessIcon = '${icons}delete_business_icon.png';
  static String paymentMethodIcon = '${icons}payment_method_icon.png';
  static String subscriptionIcon = '${icons}subscription_icon.png';
  static String changePasswordIcon = '${icons}change_password_icon.png';
  static String profileEditIcon = '${icons}profile_edit_icon.png';
  static String greaterIcon = '${icons}greater_icon.png';
  static String selectedAnalyticsIcon = '${icons}selected_analytics_icon.png';
  static String selectedExploreIcon = '${icons}selected_explore_icon.png';
  static String selectedFeedsIcon = '${icons}selected_feeds_icon.png';
  static String selectedProfileIcon = '${icons}selected_profile_icon.png';
  static String selectedSavedPostIcon = '${icons}selected_saved_post_icon.png';
  static String addFeedsIcon = '${icons}add_feeds_icon.png';
  static String shareIconIcon = '${icons}share_icon.png';
  static String locationMarkerIcon = '${icons}location_marker.png';
  static String gpsIcon = '${icons}gps_icon.png';
  static String discoverIcon = '${icons}discover_icon.png';
  static String deleteImageIcon = '${icons}delete_image_icon.png';

  // Images Paths
  static String images = 'assets/images/';
  static String atlantisImage = '${images}atlantis_image.png';
  static String bahaImage = '${images}baha_image.png';
  static String cabbageBeaachImage = '${images}cabbage_beaach_image.png';
  static String cafeImage = '${images}cafe_image.png';
  static String duneResturantImage = '${images}dune_resturant_image.png';
  static String islandImage = '${images}island_image.jpg';
  static String cabbageBeachFullSizeImage = '${images}cabbage_beach_full_sie_image.png';
  static String jenniferImage = '${images}jennifer_image.png';
  static String juliaImage = '${images}julia_image.png';
  static String islandBottomImage = '${images}islandBottom_image.png';
  static String feedsImage = '${images}feeds_image.png';
  static String feedsImage1 = '${images}feeds_image1.png';
  static String feedsImage2 = '${images}feeds_image2.png';
  static String feedsBottomBlackShade = '${images}feeds_bottom_black_shade.png';
  static String businessDetailFullImage = '${images}business_detail_full_image.png';
  
}
