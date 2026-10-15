import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.widget, required this.height, required this.width});
final Widget widget;
final int height;
final int width;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width:width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary,
            offset: Offset(1.w, 1.h),
            blurRadius: 10.r,
            spreadRadius: 1.r,
          ),
          BoxShadow(
            color: AppColors.secondary,
            offset: Offset(-1.w, -1.h),
            blurRadius: 10.r,
            spreadRadius: 1.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child:
        widget
      ),
    );
  }
}
