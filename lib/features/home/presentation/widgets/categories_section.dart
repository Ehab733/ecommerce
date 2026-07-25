import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  late final HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الجزء الخاص بالعنوان "Categories" و "View all"
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s18,
                ),
              ),
              Text(
                "view all",
                style: getRegularStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s14,
                ),
              ),
            ],
          ),
        ),

        // الشبكة (Grid) الخاصة بالتصنيفات
        SizedBox(
          height: 250.h, // مساحة تكفي لصفين من التصنيفات
          child: BlocProvider(
            create: (context) => _homeCubit,
            child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (_, state) {
                if (state is GetCategoriesLoading) {
                  return LoadingIndicator();
                } else if (state is GetCategoriesFailure) {
                  return ErrorIndicator(errorMessage: state.message);
                } else if (state is GetCategoriesSuccess) {
                  return GridView.builder(
                    scrollDirection:
                        Axis.horizontal, // تجعلها قابلة للتمرير يمين ويسار
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // صفين
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) =>
                        CategoryItem(category: state.categories[index]),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
