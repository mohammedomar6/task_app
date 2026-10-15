import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.color, required this.borderColor, required this.title});
final Color color;
final Color borderColor;
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
      height: 30.h,
      width: 105.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color:color,
          border: Border.all(color: borderColor)
      ),
      child: Center(child: Text(title,style: TextStyle(fontSize: 10.sp),)),
    );
  }
}
