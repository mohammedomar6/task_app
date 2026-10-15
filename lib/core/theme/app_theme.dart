import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData get darkTheme => ThemeData();

ThemeData get lightTheme => ThemeData(
  datePickerTheme: DatePickerThemeData(
    dayBackgroundColor: WidgetStatePropertyAll(AppColors.secondary),
//    dayOverlayColor: WidgetStatePropertyAll(AppColors.foushi),
    dayForegroundColor: WidgetStatePropertyAll(AppColors.foushi),
//    dayShape: WidgetStatePropertyAll(OvalBorder()),
 // todayBackgroundColor: WidgetStatePropertyAll(AppColors.primary),
    backgroundColor: AppColors.backgroundScaffold,
    shadowColor: AppColors.secondary,
    elevation: 10.r,
    shape:OutlineInputBorder(borderRadius: BorderRadius.circular(30.r),borderSide: BorderSide(color: AppColors.secondary))
  ),
  scaffoldBackgroundColor: AppColors.backgroundScaffold,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundScaffold,

    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 20.sp,
      fontWeight: FontWeight.w900,
    ),
  ),
  chipTheme: ChipThemeData(),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.secondary),
    ),
    hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
    suffixIconColor: AppColors.foushi,
    prefixIconColor: AppColors.foushi,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(
        color: AppColors.primary.withAlpha(100),
        width: 0.5,
      ),
    ),
  ),
  fontFamily: 'Cairo',
);
