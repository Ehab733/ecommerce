import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004182),
                ),
              ),
              Text(
                "view all",
                style: TextStyle(fontSize: 14, color: Color(0xFF004182)),
              ),
            ],
          ),
        ),

        // الشبكة (Grid) الخاصة بالتصنيفات
        SizedBox(
          height:
              Sizes.s100.h * 2 + Sizes.s50.h, // مساحة تكفي لصفين من التصنيفات
          child: BlocProvider(
            create: (context) => _homeCubit,
            child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (_, state) {
                if (state is GetCategoriesLoading) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: ColorManager.lightGrey,
                        highlightColor: ColorManager.lightGrey,
                        child: Column(
                          children: [ 
                            const CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
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
