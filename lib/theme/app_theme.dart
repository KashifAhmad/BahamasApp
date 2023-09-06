import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.yellow,
    primaryColor: Colors.white,

    brightness: Brightness.light,

    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(),
    cardColor: const Color(0xffEBFD7C),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xffF8D20F))),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
}

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 30),
    displayMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 24),
    displaySmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 18),
    headlineLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 16),
    headlineMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 15),
    headlineSmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 14),
    titleLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 20),
    titleMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 10),
    titleSmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 13),
    bodyLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 23),
    bodyMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 22),
    bodySmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 12),
  );
  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 30),
    displayMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 24),
    displaySmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 18),
    headlineLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 16),
    headlineMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 15),
    headlineSmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 14),
    titleLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 20),
    titleMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 10),
    titleSmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 13),
    bodyLarge: TextStyle(fontFamily: 'TT_Hoves', fontSize: 23),
    bodyMedium: TextStyle(fontFamily: 'TT_Hoves', fontSize: 22),
    bodySmall: TextStyle(fontFamily: 'TT_Hoves', fontSize: 12),
  );

  // Fonts paths
  static var ttHovesMedium = "TTHovesMedium";
  static var ttHovesRegular = "TTHovesRegular";
  static var ttHovesLight = "TTHovesLight";
  static var ttHovesDemiBold = "TTHovesDemiBold";
  static var ttHovesBold = "TTHovesBold";

  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffFFFFFF);
  static Color color858993 = const Color(0xff858993);
  static Color color2D2D33 = const Color(0xff2D2D33);
  static Color color181818 = const Color(0xff181818);
  static Color colorF8D20F = const Color(0xffF8D20F);
  static Color colorABB2C4 = const Color(0xffABB2C4);
  static Color colorD9D9D9 = const Color(0xffD9D9D9);
  static Color color828898 = const Color(0xff828898);
  static Color colorFFFEFB = const Color(0xffFFFEFB);
  static Color colorFEF8DC = const Color(0xffFEF8DC);
  static Color colorF1F1F1 = const Color(0xffF1F1F1);
  static Color colorEBFD7C1 = const Color(0xffEBFD7C);
  static Color colorB8F268 = const Color(0xffB8F268);
  static Color color7C6DF6 = const Color(0xff7C6DF6);
  static Color colorF6C6DC = const Color(0xffF6C6DC);
  static Color colorB2FFCC = const Color(0xffB2FFCC);
  static Color colorC2E1FF = const Color(0xffC2E1FF);
  static Color colorFFCDC2 = const Color(0xffFFCDC2);
  static Color colorE7E8E9 = const Color(0xffE7E8E9);
  static Color colorF6E9C6 = const Color(0xffF6E9C6);
  static Color colorCCC6FE = const Color(0xffCCC6FE);
  static Color colorF9EFC0 = const Color(0xffF9EFC0);
  static Color colorF3F3F3 = const Color(0xffF3F3F3);
  static Color colorFFFBE9 = const Color(0xffFFFBE9);
  static Color colorEBFD7C = const Color(0xffEBFD7C);
  static Color color6D7076 = const Color(0xff6D7076);
  static Color colorFFFDF5 = const Color(0xffFFFDF5);
  static Color color969699 = const Color(0xff969699);
  static Color color3B3B40 = const Color(0xff3B3B40);
  static Color colorF8F37E = const Color(0xffF8F37E);
}
