import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/state/request_state.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/task/data/models/category_model.dart';
import 'package:notes_app/task/presentation/manager/category_cubit.dart';
import 'package:uuid/uuid.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> images = ['🍓', '🌷', '🎀', '💼', '📚', '🎨', '☕', '✨'];
  TextEditingController controller = TextEditingController();
  List<String> priority = ['قصوى🎀', 'متوسطة⚡', 'هادئة🌸'];
  String selectedP = 'قصوى🎀';
  int selectedIndex = 0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if(state.addCategories.status==Status.success){
          print('dd');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تمت الإضافة بنجاح 💖',style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: AppColors.foushi,));
        }
        if(state.addCategories.status==Status.error){
          print('dd');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.addCategories.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundScaffold,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundScaffold,
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
            title: Text(
              'أصناف مهامي',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ),

            actions: [
              Image.asset('assets/images/text.png'),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child:
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          AppColors.secondary),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        //isDismissible: false,
                        context: context,
                        builder:
                            (context) =>
                            SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 15,
                                ),
                                height: 618.h,
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
                                          borderRadius: BorderRadius.circular(
                                              4.r),
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
                                        SizedBox(width: 5),
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
                                        cursorColor: AppColors.secondary,
                                        decoration: InputDecoration(),
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
                                              borderRadius: BorderRadius
                                                  .circular(
                                                20.r,
                                              ),
                                              color: AppColors
                                                  .backgroundScaffold,
                                              border: Border.all(
                                                color: AppColors.secondary,
                                              ),
                                            ),
                                            child: GridView.builder(
                                              physics: NeverScrollableScrollPhysics(),
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
                                                  selected: index ==
                                                      selectedIndex,
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
                                                        : AppColors.secondary,
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
                                              foregroundColor: WidgetStatePropertyAll(
                                                AppColors.white,
                                              ),
                                              backgroundColor: WidgetStatePropertyAll(
                                                AppColors.foushi,
                                              ),
                                            ),
                                            onPressed: () {

                                              final uuid = Uuid();

                                              String id = uuid.v4();
                                              context
                                                  .read<CategoryCubit>()
                                                  .addCategory(
                                                CategoryModel(
                                                  id: id,
                                                  name: controller.text,
                                                  image: images[selectedIndex],
                                                  priority: selectedP,
                                                ),
                                              );
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
                                            selectedIndex=0;
                                            selectedP='';
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
                    },
                    label: Image.asset("assets/images/add.png"),
                    icon: Icon(Icons.add, color: AppColors.primary),
                  )

              ),

            ],
          ),
        );
      },
    );
  }
}
