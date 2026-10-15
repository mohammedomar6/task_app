import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,  this.shape,
  });

  final String title;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final OutlinedBorder? shape ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:8.w,vertical: 10.h),
      child: ChoiceChip(
        label: Text(title),
        selected: isSelected,
        onSelected: onSelected,
        shape:shape?? CircleBorder() ,
        side: BorderSide(
          color: isSelected
              ? AppColors.foushi
              : AppColors.secondary,
        ),
        selectedColor: AppColors.secondary,
        backgroundColor: AppColors.white,
        showCheckmark: false,
      ),
    );
  }
}