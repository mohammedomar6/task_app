import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/task/presentation/pages/category_page.dart';

import '../../../core/state/request_state.dart';
import '../../../core/theme/app_colors.dart';
import '../manager/category_cubit.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {

        if (state.getCategories.status == Status.error) {
          return SliverToBoxAdapter(child: Center(child: Text(state.getCategories.error)));
        }
        else if (state.getCategories.status == Status.success ) {
          final categories = state.getCategories.data ?? [];

          if (categories.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('لا توجد أصناف حالياً'),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: categories.length,(context, index) => Container(
              constraints: BoxConstraints(
                minHeight: 160.h,
              ),
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
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
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.white,
              ),
              margin: EdgeInsets.all(10.r),
              child: Column(
                children: [
                  Row(


                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondary,
                        ),
                        child: Text(
                          categories[index].image,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('8 مهام نشطة ',)
                        ],
                      ),
                      Spacer(),
                      Text(
                        categories[index].priority,
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(spacing: 5,children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.backgroundScaffold),
                      child: IconButton(onPressed: () {
                        showSheet('edit', context,categoryModel: categories[index]);
                      }, icon: Icon(Icons.edit,color: AppColors.primary,)),
                    ),

                    Container(
                      width:  50.w,
                      height: 50.h,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.backgroundScaffold),
                      child: IconButton(onPressed: () {
                        context.read<CategoryCubit>().deleteCategory(state.getCategories.data![index].id);

                      }, icon: Icon(Icons.delete,color: AppColors.foushi,)),
                    ),
              const       Spacer(),
                  const  Text('عدد المهام المكتملة : 8')
                  ],)
                ],
              ),
            ),),
         
           
          );
        } else if (state.getCategories.status == Status.loading) {
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
