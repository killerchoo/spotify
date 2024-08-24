import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    inputDecorationTheme:  InputDecorationTheme(
      hintStyle: const TextStyle(color: Color(0xff383838),fontWeight: FontWeight.w500),
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black,width: 0.4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black,width: 0.4),
      ),

    ),
    fontFamily: 'satoshi',
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
    ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    inputDecorationTheme:  InputDecorationTheme(
      hintStyle: const TextStyle(color: Color(0xffA7A7A7),fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white,width: 0.4),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white,width: 0.4),
        ),

    ),
    fontFamily: 'satoshi',

    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
      ),
    ),
  );
}