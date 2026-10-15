import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/task/presentation/pages/category_page.dart';
import 'package:notes_app/task/presentation/pages/completion_page.dart';
import 'package:notes_app/task/presentation/pages/my_tasks_page.dart';
import 'package:notes_app/task/presentation/pages/setting_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List<IconData> icons = [
    Icons.task_alt_outlined,
    Icons.category_outlined,
    Icons.star_border,
    Icons.settings_accessibility,
  ];

  List<String> labels = ["مهامي", "الفئات", "الإنجازات", "الإعدادات"];

  List<Widget> pages = [
    MyTasksPage(),
    CategoryPage(),
    CompletionPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,

      body: pages[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12.r),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40.r),
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

          child: Row(
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.secondary : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icons[index], color: AppColors.primary),
                        SizedBox(height: 4.h),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
