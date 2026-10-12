  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData get  darkTheme => ThemeData();
ThemeData get lightTheme => ThemeData(

  inputDecorationTheme: InputDecorationTheme(

    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r),borderSide: BorderSide(color: AppColors.secondary)),
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(30.r),
    ),
  ),
  fontFamily: 'Cairo'
);