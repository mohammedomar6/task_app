import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30.h,
      width: 105.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.secondary,
          border: Border.all(color: AppColors.foushi)
      ),
      child: Center(child: Text(text,style: TextStyle(fontSize: 10.sp),)),
    );
  }
}
