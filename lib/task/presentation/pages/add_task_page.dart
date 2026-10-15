import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/state/request_state.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:notes_app/task/presentation/pages/category_page.dart';
import 'package:notes_app/task/presentation/widgets/card_widget.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/task/presentation/widgets/choice_chip_widget.dart';
import 'package:notes_app/task/presentation/widgets/custom_list_tile_widget.dart';
import 'package:notes_app/task/presentation/widgets/list_tile_widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController taskNameController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  List<String> priority = ['قصوى🎀', 'متوسطة⚡', 'هادئة🌸'];

  int selectedIndex = 0;

  Color borderColor = AppColors.secondary;
  int indexSelected = 0;
  DateTime? dateTime = DateTime.now();
  TimeOfDay? day = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundScaffold,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary,
            ),
            child: Icon(Icons.arrow_back, color: AppColors.primary),
          ),
        ),
        title: Text(
          "إضافة مهمة جديدة🌸",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            height: 43.h,
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/stars.png"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CardWidget(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Text(
                          "عنوان المهمة اللطيفة 🎀",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        controller: taskNameController,
                        cursorColor: AppColors.secondary,
                        decoration: InputDecoration(
                          hintText: 'مثال: مراجعة العرض التقديمي للعمل 💻',
                        ),
                      ),
                      SizedBox(height: 15.h),
                      TextField(
                        controller: noteController,
                        cursorColor: AppColors.secondary,
                        decoration: InputDecoration(
                          hintText:
                              'إضافة ملاحظة صغيرة أو تذكير مبهج... (اختياري) 📝',
                        ),
                      ),
                    ],
                  ),
                  height: 220,
                  width: 350,
                ),
                SizedBox(height: 20.h),
                CardWidget(
                  widget: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: AppColors.primary,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Text(
                              "التصنيف (Category)",
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 210.h,
                        child: BlocBuilder<CategoryCubit, CategoryState>(
                          builder: (context, state) {
                            if (state.getCategories.status == Status.loading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.foushi,
                                ),
                              );
                            } else if (state.getCategories.status ==
                                Status.error) {
                              return Center(
                                child: Text(
                                  state.getCategories.error,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              );
                            } else if (state.getCategories.status ==
                                Status.success) {
                              final categories = state.getCategories.data ?? [];
                              if (categories.isEmpty) {
                                return Center(
                                  child: Text('لا توجد فئات حالياً'),
                                );
                              }
                              return GridView.builder(
                                itemCount: categories.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 12.h,
                                      childAspectRatio: 1.8,
                                    ),
                                itemBuilder: (context, index) {
                                  return ChoiceChip(
                                    selected: indexSelected == index,
                                    onSelected: (selected) {
                                      setState(() {
                                        indexSelected = index;
                                      });
                                    },
                                    showCheckmark: false,
                                    padding: EdgeInsets.zero,

                                    selectedColor:
                                        indexSelected == index
                                            ? AppColors.secondary
                                            : AppColors.backgroundScaffold,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      side: BorderSide(
                                        color:
                                            indexSelected == index
                                                ? AppColors.foushi
                                                : borderColor,
                                        width: indexSelected == index ? 3 : 1,
                                      ),
                                    ),
                                    label: SizedBox(
                                      width: double.infinity,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                        ),
                                        title: Text(
                                          categories[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        subtitle: Text(
                                          categories[index].subTitle,
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                        leading: Text(
                                          categories[index].image,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: Radius.circular(20.r),
                          color: AppColors.foushi,
                          dashPattern: [3],
                        ),
                        child: InkWell(
                          onTap: () {
                            showSheet('add', context);
                          },
                          child: Container(
                            width: 308.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle_outline_sharp),
                                Text(
                                  'إضافة تصنيف جديد ومبهج ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 330,
                  width: 350,
                ),
                SizedBox(height: 20.h),
                CardWidget(
                  widget: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "تاريخ ووقت الاستحقاق",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ListTileWidget(
                        title: "اليوم المحدد",
                        subTitle:
                            '${DateFormat('EEEE، d MMMM yyyy', 'ar').format(dateTime!) ?? ''}',
                        icon: Icon(Icons.calendar_month_sharp),
                        onTap: () async {
                          dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                          );
                          setState(() {});
                        },
                      ),
                      ListTileWidget(
                        title: "وقت التنبيه",
                        subTitle: '${day!.hour}:${day!.minute}',
                        icon: Icon(Icons.watch_later_outlined),
                        onTap: () async {
                          day = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 12, minute: 00),
                          );
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  height: 250,
                  width: 350,
                ),
                SizedBox(height: 20.h),
                CardWidget(
                  widget: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.primary),
                          SizedBox(width: 10.w),
                          Text(
                            "مستوى الأولوية",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(priority.length, (index) {
                          return ChoiceChip(
                            showCheckmark: false,
                            label: Text(priority[index]),
                            selected: index == selectedIndex,
                            onSelected: (value) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },

                            padding: EdgeInsets.zero,

                            selectedColor:
                                selectedIndex == index
                                    ? AppColors.secondary
                                    : AppColors.backgroundScaffold,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(
                                color:
                                    selectedIndex == index
                                        ? AppColors.foushi
                                        : borderColor,
                                width: selectedIndex == index ? 2 : 1,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  height: 120,
                  width: 350,
                ),
                SizedBox(height: 20.h),
                CardWidget(
                  widget: Column(
                    children: [
                      CustomListTileWidget(
                        title: "الحالة الأولية (isCompleted)",
                        subTitle: "هل أنجزت هذه المهمة مسبقاً",
                        color: AppColors.green,
                        colorText: AppColors.greenText,
                      ),
                      Divider(endIndent: 30.w, indent: 30.w),
                      CustomListTileWidget(
                        title: "تذكير ذكي ونغمات رقيقة",
                        subTitle: "إشعار صوتي دافئ قبل 15 دقيقة",
                        color: AppColors.mov,
                        colorText: AppColors.movText,
                      ),
                    ],
                  ),
                  height: 200,
                  width: 350,
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "إلغاء",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.primary,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.white,
                        ),
                      ),
                      onPressed: () {

                      },
                      child: Text(
                        "حفظ المهمة السعيدة 🌸",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
