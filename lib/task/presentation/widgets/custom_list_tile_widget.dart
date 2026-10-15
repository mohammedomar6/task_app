import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({super.key, required this.title, required this.subTitle, required this.color, required this.colorText});
  final String title;
  final String subTitle;
  final Color color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(subTitle,style: TextStyle(fontSize: 12.sp),),
      leading: Container(
        height: 40.h,
        width: 40.w,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color:color,
      ),
        child: Icon(Icons.check_circle_outline,color: colorText),
      ),
    );
  }
}
