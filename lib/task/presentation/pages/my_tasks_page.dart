import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:notes_app/task/presentation/pages/add_task_page.dart';
import 'package:notes_app/task/presentation/pages/category_page.dart';
import 'package:notes_app/task/presentation/widgets/choice_chip_widget.dart';
import 'package:notes_app/task/presentation/widgets/container_widget.dart';
import 'package:notes_app/task/presentation/widgets/text_field_widget.dart';

import '../../../core/theme/app_colors.dart';

class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key});

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  List<String> status = ["المهام الحالية🌸", "المهمة⚡", "المكتملة✅"];
  List<String> option = ['حذف', 'تعديل'];
  List<Color> colors = [AppColors.foushi, AppColors.mshmsh, AppColors.mov];
  List<Color> colorsText = [
    AppColors.primary,
    AppColors.mshmshText,
    AppColors.movText,
  ];
  bool isChecked = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundScaffold,
        leadingWidth: 50.w,
        leading: Container(
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/stars.png"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "مهامي اليومية🌷",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 5.h),
            Text("صباح الورد والنشاط 🌸", style: TextStyle(fontSize: 11.sp)),
          ],
        ),

        actions: [
          Image.asset("assets/images/text.png"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Stack(
              children: [
                Image.asset("assets/images/backgroundContainer.png"),
                Positioned(
                  right: 4.w,
                  top: 3.h,
                  child: Image.asset("assets/images/girl.png"),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/images/cute.png"),
                Positioned(
                  top: 35.h,
                  right: 45.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28.h,
                        width: 121.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.foushi),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "إنتاجية سعيدة 💖",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "مرحباً، يا بطلة! ✨🐰",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "أنجزت ِ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: "4 من 7",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "مهام اليوم! تبقت 3 مهام لطيفة \nفقط 🍓",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 220.w,
                            height: 8.h,
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: AppColors.secondary,
                              color: AppColors.foushi,
                              minHeight: 10.h,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "57%",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 100.w,
                          top: 10.h,
                        ),
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: 0.45,
                                constraints: BoxConstraints(
                                  maxHeight: 120,
                                  maxWidth: 120,
                                  minHeight: 70,
                                  minWidth: 70,
                                ),
                                strokeWidth: 5,
                                backgroundColor: AppColors.secondary,
                                color: AppColors.foushi,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '🍓\n45%\nمُكتمل',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: TextFieldWidget(
                width: 350,
                height: 50,
                hint: "ابحثي في مهامكِ اللطيفة... 🔍",
                suffix: Icons.filter_list_sharp,
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  status.length,
                  (index) => CustomChoiceChip(
                    shape: StadiumBorder(),
                    title: status[index],
                    isSelected: index == selectedIndex,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "التصنيفات اللطيفة",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage()),
                      );
                    },
                    child: Text(
                      "عرض الكل >",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.r),
                    height: 35.h,
                    width: 92.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: colors[index],
                    ),
                    child: Center(
                      child: Text(
                        "الكل 🌟",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: colorsText[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                textAlign: TextAlign.start,
                "قائمة المهام اليومية 🌷",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  width: 350.w,
                  height: 155.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(32.r),
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
                      horizontal: 10.h,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              shape: CircleBorder(),
                              activeColor: AppColors.foushi,
                              checkColor: Colors.white,
                              side: BorderSide(
                                color: AppColors.secondary,
                                width: 2.r,
                              ),
                            ),
                            Text(
                              "شراء فراولة وشموع معطرة 🍓🕯️",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            PopupMenuButton<String>(
                              iconColor: AppColors.foushi,
                              color: AppColors.secondary,
                              onSelected: (value) {
                                if (value == 'تعديل') {}
                                if (value == 'حذف') {}
                              },
                              itemBuilder: (context) {
                                return option
                                    .map(
                                      (e) => PopupMenuItem<String>(
                                        child: Center(child: Text(e)),
                                      ),
                                    )
                                    .toList();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(

                          children: [
                           ContainerWidget(color: AppColors.secondary, borderColor: AppColors.foushi, title: "أولوية قصوى🌷",),
                            ContainerWidget(color: AppColors.mov, borderColor: AppColors.movText, title: "عناية لطيفة ✨")
                          ],
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left: 15.w,top: 18.h),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.access_time,size: 15.r,color: AppColors.primary,),
                              SizedBox(width: 3.w,),
                              Text("غداً 10:00 ص",style: TextStyle(fontSize: 12.sp,color: AppColors.black),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained ,
      floatingActionButton:InkWell(
        onTap:(){
          context.read<CategoryCubit>().getAllCategory();
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskPage(),));
        }
        ,
        child: Container(width: 200,height: 100,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/button.png"))),
        child: Center(child: Padding(
          padding:  EdgeInsets.only(bottom: 20.h),
          child: Text("+ مهمة جديدة 🌸",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold),),
        )),
        ),
      ),
    );
  }
}
