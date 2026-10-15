import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../data/models/category_model.dart';
import '../manager/category_cubit.dart';

class AddSection extends StatefulWidget {
  final CategoryModel? categoryModel;
  final String type;

  AddSection({super.key, this.categoryModel, required this.type});

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  List<String> images = ['🍓', '🌷', '🎀', '💼', '📚', '🎨', '☕', '✨'];

  TextEditingController controller = TextEditingController();
  TextEditingController subController = TextEditingController();

  List<String> priority = ['قصوى🎀', 'متوسطة⚡', 'هادئة🌸'];

  String selectedP = 'قصوى🎀';

  int selectedIndex = 0;

  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    selectedP =
    widget.type == 'edit' ? widget.categoryModel!.priority : selectedP;
    controller.text =
    widget.type == 'edit' ? widget.categoryModel!.name : controller.text;
    selectedIndex = widget.type == 'edit'
        ? images.indexOf(widget.categoryModel!.image)
        : selectedIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 15.w,
          ),
          height: 650.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  width: 48.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondary,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/flowers.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'إضافة أو تعديل صنف لطيف 🌸',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'رتبي مهامكِ بأناقة وألوان مرحة',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '×',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),

              Divider(
                height: 30.h,
                endIndent: 30.w,
                indent: 30.w,
                color: AppColors.secondary,
              ),
              Text(
                'اسم الصنف اللطيف (Category Name)* ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 340.w,
                height: 46.h,
                child: TextField(
                  controller: controller,
                  cursorColor: AppColors.secondary,

                ),
              ),
              SizedBox(height: 10.h,),
              Text(
                ' تفاصيل الصنف اللطيف (Category SubTitle)* ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 340.w,
                height: 46.h,
                child: TextField(
                  controller: subController,
                  cursorColor: AppColors.secondary,

                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'صورة أو أيقونة الصنف (Image / Icon)',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'رفع صورة 📷',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ],
              ),
              StatefulBuilder(
                builder:
                    (context, setState) =>
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      height: 150.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                        color: AppColors.backgroundScaffold,
                        border: Border.all(
                          color: AppColors.secondary,
                        ),
                      ),
                      child: GridView.builder(
                        physics:
                        NeverScrollableScrollPhysics(),
                        itemCount: images.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                        ),
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            onSelected: (value) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            side: BorderSide(
                              color:
                              selectedIndex == index
                                  ? AppColors.foushi
                                  : AppColors.secondary,
                            ),
                            label: Text(images[index]),
                            selected: index == selectedIndex,
                            shape: CircleBorder(),
                            selectedColor:
                            index == selectedIndex
                                ? AppColors.secondary
                                : AppColors.white,
                            showCheckmark: false,
                          );
                        },
                      ),
                    ),
              ),
              Text(
                'مستوى الأولوية (Priority)',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children:
                    priority
                        .map(
                          (e) =>
                          ChoiceChip(
                            side: BorderSide(
                              color:
                              selectedP == e
                                  ? AppColors.foushi
                                  : AppColors
                                  .secondary,
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(),
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedP = e;
                              });
                            },
                            selectedColor:
                            selectedP == e
                                ? AppColors.secondary
                                : AppColors.white,
                            showCheckmark: false,
                            label: Text(e),
                            selected: selectedP == e,
                          ),
                    )
                        .toList(),
                  );
                },
              ),
              SizedBox(height: 10.h),
              Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 260.w,
                    height: 42.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                        WidgetStatePropertyAll(
                          AppColors.white,
                        ),
                        backgroundColor:
                        WidgetStatePropertyAll(
                          AppColors.foushi,
                        ),
                      ),
                      onPressed: () {
                        if (widget.type == 'add') {
                          final uuid = Uuid();

                          String id = uuid.v4();
                          context
                              .read<CategoryCubit>()
                              .addCategory(
                            CategoryModel(
                              subTitle: subController.text,
                              id: id,
                              name: controller.text,

                              image: images[selectedIndex],
                              priority: selectedP,
                            ),
                          );
                        }
                        else if (widget.type == 'edit') {
                          context.read<CategoryCubit>().updateCategory(
                              CategoryModel(id: widget.categoryModel!.id,
                                    subTitle: subController.text,
                                  name: controller.text,
                                  image: images[selectedIndex],
                                  priority: selectedP));
                        }
                        Navigator.pop(context);

                      },
                      child: Text('حفظ الصنف اللطيف 💖'),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        AppColors.black,
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.backgroundScaffold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      controller.clear();
                      selectedIndex = 0;
                      selectedP = '';
                    },
                    child: Text('إلغاء'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
