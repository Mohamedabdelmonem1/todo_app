import 'package:flutter/material.dart';
import 'package:todo_app_route/core/app_color.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLightColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onPrimary: AppColors.primaryColor,
      onSecondary: AppColors.backgroundLightColor,
    ),
    dividerColor: AppColors.dividerColor,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade500,
      ),
      unselectedItemColor: Colors.grey.shade500,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.primaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 5,
        ),
      ),
      /////////////////////or//////////////////////
      // RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(35),),
      //   side: BorderSide(
      //     color: AppColors.whiteColor,
      //     width: 5,
      //   ),
      // ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF141A2E),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF141A2E),
      onPrimary: const Color(0xFF141A2E),
      onSecondary: const Color(0xFFFACC1D),
      primary: const Color(0xFFFACC1D),
      background: const Color(0xFF141A2E),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141A2E),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Color(0xFFFACC1D),
      ),
      selectedItemColor: Color(0xFFFACC1D),
      unselectedIconTheme: IconThemeData(
        size: 26,
        color: Colors.white,
      ),
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        )),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFF141A2E).withOpacity(0.7),
    ),
    dividerColor: const Color(0xFFFACC1D),
  );
}
