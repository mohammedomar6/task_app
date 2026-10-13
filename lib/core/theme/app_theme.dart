import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData get darkTheme => ThemeData();

ThemeData get lightTheme => ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.secondary),

    ),
    hintStyle: TextStyle(fontSize: 13.sp,color: Colors.grey.shade600),
    suffixIconColor: AppColors.foushi,
    prefixIconColor: AppColors.foushi,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.primary.withAlpha(100),width: 0.5),
    ),
  ),
  fontFamily: 'Cairo',
);
