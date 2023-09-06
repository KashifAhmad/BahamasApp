import 'dart:convert';
import 'package:bahamas/data/models/get_business_by_user_model.dart';
import 'package:bahamas/data/models/user_model.dart';
import 'package:bahamas/data/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  static final SessionController _session = SessionController._internel();

  bool? isLogin;
  UserModel? user;
  GetBusinessByUser? businessProfile;
  String selectedLocation = '';
  double? lat;
  double? lon;
  String? businessId;
  double? currentlat;
  double? currentlon;
  // late UserModel user;

  factory SessionController() {
    return _session;
  }

  SessionController._internel() {
    // here we can initialize the values
    isLogin = false;
  }

  // saving user data into shared prefrences
  static Future<void> saveUserInPreference(dynamic user) async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);
    SharedPreferenceClass.setValue('user', jsonEncode(user));
  }

   // saving business profile data into shared prefrences
  static Future<void> saveBusinessProfileInPreference(dynamic businessProfile) async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);
    SharedPreferenceClass.setValue('businessProfile', jsonEncode(businessProfile));
  }

  static Future<void> saveRefreshSessionTokens(var user) async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);
    SharedPreferenceClass.setValue('user', user);
  }

  //getting User Data from shared Prefrence
  static Future<void> getUserFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dynamic userData = prefs.getString("user")!;

      //if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      //}

      SessionController().isLogin = prefs.getBool('isLogin');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //getting Business profile Data from shared Prefrence
  static Future<void> getBusinessProfileFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dynamic businessProfileData = prefs.getString("businessProfile")!;

      //if (userData.isNotEmpty) {
        SessionController().businessProfile = GetBusinessByUser.fromJson(jsonDecode(businessProfileData));
        debugPrint(businessProfileData);
      //}

      SessionController().isLogin = prefs.getBool('isLogin');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //removing User Data from Prefrence
  static Future<void> removeUserFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.remove('isLogin');
    prefs.setString('user', '');
    prefs.setBool('isLogin', false);
  }

  //removing Business profile Data from Prefrence
  static Future<void> removeBusinessPorfileFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('businessProfile');
    prefs.remove('isLogin');
    prefs.setString('businessProfile', '');
    prefs.setBool('isLogin', false);
  }
}
