import 'package:bahamas/Business_side/business_bottom_navigationbar/Analytics_screen/analytics_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/business_tab_screens/business_tab_main_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/feeds_tab_screens/business_feeds_tab_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/home_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/home_tab_screens/profile_screens/my_profile_screen.dart';
import 'package:bahamas/Business_side/business_bottom_navigationbar/saved_tab_screen/business_saved_post_screen.dart';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/session_controller.dart';
import 'package:bahamas/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BusinessBottomNavigationBar extends StatefulWidget {
  const BusinessBottomNavigationBar({super.key});

  @override
  State<BusinessBottomNavigationBar> createState() =>  _BusinessBottomNavigationBarState();
}

class _BusinessBottomNavigationBarState extends State<BusinessBottomNavigationBar> {

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptionsForBusiness = <Widget>[
    HomeScreen(),
    BusinessFeedsTabScreen(),
    AnalyticsScreen(),
    BusinessSavedPostScreen(),
    BusinessTabMainScreen(),
  ];

  static const List<Widget> _widgetOptionsForUser = <Widget>[
    HomeScreen(),
    BusinessFeedsTabScreen(),
    BusinessSavedPostScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SessionController().user?.data?.profileType.toString() == 'User' ? _widgetOptionsForUser.elementAt(_selectedIndex) : _widgetOptionsForBusiness.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: SessionController().user?.data?.profileType.toString() == 'Business'
        ?
        <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 0 ? Constant.selectedExploreIcon : Constant.exploreTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 1 ? Constant.selectedFeedsIcon : Constant.feedTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 2 ? Constant.selectedAnalyticsIcon : Constant.analyticsTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 3 ? Constant.selectedSavedPostIcon : Constant.savedTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 4 ? Constant.selectedProfileIcon : Constant.profileTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Business',
          ),
        ]
        :
        <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 0 ? Constant.selectedExploreIcon : Constant.exploreTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 1 ? Constant.selectedFeedsIcon : Constant.feedTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 2 ? Constant.selectedSavedPostIcon : Constant.savedTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 3 ? Constant.selectedProfileIcon : Constant.profileTabIcon,
              height: 25,
              width: 25,
            ),
            label: 'Profile',
          ),
        ],
        
        
        currentIndex: _selectedIndex,
        selectedItemColor: AppTextTheme.color2D2D33,
        unselectedItemColor: AppTextTheme.color2D2D33,
        selectedLabelStyle: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
          fontFamily: AppTextTheme.ttHovesRegular,
          color: AppTextTheme.color2D2D33,
        ),
        unselectedLabelStyle: AppTextTheme.lightTextTheme.headlineSmall!.copyWith(
          fontFamily: AppTextTheme.ttHovesRegular,
          color: AppTextTheme.color2D2D33,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
