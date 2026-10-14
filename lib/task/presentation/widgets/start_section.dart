import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/theme/app_colors.dart';

import '../../../core/constants/asset_constants.dart';

class StartSection extends StatelessWidget {
  const StartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(AssetConstants.cateBack,height: 300,),
        Positioned(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إجمالي التصنيفات: 5 \nتصنيفات لطيفة',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff544249),
                  ),
                  children: [
                    TextSpan(text: 'لديكِ'),
                    TextSpan(
                      text: ' 28 مهمة نشطة ',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    TextSpan(text: 'موزعة بانسجام\n'),
                    TextSpan(text: 'تام عبر قوائمكِ اليومية.'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 308.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('معدل الإنجاز'),
                      Text('🌟 84% ',style: TextStyle(color: AppColors.primary),)
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('الاعلى نشاطاً'),
                      Text('تسوق وحلويات 🍓')
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
