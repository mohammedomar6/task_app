import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/constants/asset_constants.dart';
import 'package:notes_app/core/helper/snakbar_massege.dart';
import 'package:notes_app/core/state/request_state.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/task/data/models/category_model.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:notes_app/task/presentation/widgets/add_section.dart';
import 'package:notes_app/task/presentation/widgets/category_section.dart';
import 'package:notes_app/task/presentation/widgets/choice_chip_widget.dart';
import 'package:notes_app/task/presentation/widgets/start_section.dart';
import 'package:notes_app/task/presentation/widgets/text_field_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> priority = [
    'الكل',
    'أولوية قصوى',
    'اولوية متوسطة',
    'اولوية هادئة',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryCubit, CategoryState>(
          listenWhen:
              (previous, current) =>
                  previous.addCategories.status != current.addCategories.status,

          listener: (context, state) {
            if (state.addCategories.status == Status.success) {
              showMessage(context, 'تمت الإضافة بنجاح 💖');
            }

            if (state.addCategories.status == Status.error) {
              showMessage(context, state.addCategories.error);
            }
          },
        ),

        // Update Category
        BlocListener<CategoryCubit, CategoryState>(
          listenWhen:
              (previous, current) =>
                  previous.updateCategories.status !=
                  current.updateCategories.status,

          listener: (context, state) {
            if (state.updateCategories.status == Status.success) {
              showMessage(context, 'تمت التعديل بنجاح 💖');
            }

            if (state.updateCategories.status == Status.error) {
              showMessage(context, state.updateCategories.error);
            }
          },
        ),

        // Delete Category
        BlocListener<CategoryCubit, CategoryState>(
          listenWhen:
              (previous, current) =>
                  previous.deleteCategories.status !=
                  current.deleteCategories.status,

          listener: (context, state) {
            if (state.deleteCategories.status == Status.success) {
              showMessage(context, 'تمت الحذف بنجاح 💖');
            }

            if (state.deleteCategories.status == Status.error) {
              showMessage(context, state.deleteCategories.error);
            }
          },
        ),
      ],

      child: Scaffold(
        body: CustomScrollView(

          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 const StartSection(),
                  Center(
                    child: TextFieldWidget(

                      width: 350.w,
                      height: 52.h,
                      hint: 'ابحثي عن صنف، وسم، أو كود التصنيف (#CAT)...',
                    ),
                  ),
                  SizedBox(height: 10.w),
                  SingleChildScrollView(
                    padding: EdgeInsets.all(10.r),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8.w,
                      children: List.generate(
                        priority.length,
                            (index) => CustomChoiceChip(
                          shape: StadiumBorder(),
                          title: priority[index],
                          isSelected: selectedIndex == index,
                          onSelected: (value) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      'التصنيفات المتاحة',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

         const   CategorySection(),
          ],
        ),

        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(right: 10.r),
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondary, width: 2.w),
            ),
            child: Image.asset('assets/images/rabbit.png'),
          ),
          title: Text('أصناف مهامي'),

          actions: [
            Image.asset(AssetConstants.text),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
                ),
                onPressed: () {
                  showSheet('add', context);
                },
                label: Image.asset(AssetConstants.add),
                icon: Icon(Icons.add, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSheet(
  String type,
  BuildContext context, {
  CategoryModel? categoryModel,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,

    //isDismissible: false,
    context: context,
    builder: (context) => AddSection(type: type, categoryModel: categoryModel),
  );
}
