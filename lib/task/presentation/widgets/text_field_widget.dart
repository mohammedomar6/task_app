import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
    this.textEditingController,
    this.onChanged,
  });

  final void Function(String)? onChanged;
  final double width;
  final TextEditingController? textEditingController;
  final double height;

  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,

      child: TextField(
        onChanged: onChanged,
        controller: textEditingController,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.highlight_remove_outlined),
          prefixIcon: Icon(Icons.search_outlined, color: AppColors.foushi),

          hintText: hint,

        ),
      ),
    );
  }
}
