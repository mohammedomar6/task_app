import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.subTitle, required this.icon, this.onTap});
  final String title;
  final String subTitle;
  final Icon icon;
  final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 12.h),
      width: 308.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundScaffold,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.secondary),
      ),
      child: ListTile(

        iconColor: AppColors.primary,
        title: Padding(
          padding: EdgeInsets.only(
            bottom: 5.h
          ),
          child: Text(
           title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
          ),
        ),
        subtitle: Text(
           subTitle,
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
        leading: icon,
        onTap: onTap,
        trailing: Icon(Icons.expand_more_outlined),
      ),
    );
  }
}
