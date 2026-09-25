import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit_state.dart';
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
  int _selectedIndex = 0; // متابعة التصنيف المحدد

  @override
  void initState() {
    super.initState();
    _homeCubit = getIt<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _homeCubit.getCategories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1️⃣ الشريط العلوي (Modern Header & Filter Chips)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s20.w,
            vertical: Insets.s8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(Sizes.s4.r),
                    ),
                  ),
                  SizedBox(width: Sizes.s8.w),
                  Text(
                    "Categories",
                    style: getBoldStyle(
                      color: ColorManager.textPrimary,
                      fontsize: FontSize.s18.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildModernActionButton(
                    label: 'Sort',
                    icon: Icons.swap_vert_rounded,
                    onTap: () {},
                  ),
                  SizedBox(width: Sizes.s8.w),
                  _buildModernActionButton(
                    label: 'Filter',
                    icon: Icons.tune_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: Sizes.s14.h),

        // 2️⃣ قائمة التصنيفات التفاعلية
        SizedBox(
          height: 116.h,
          child: BlocProvider.value(
            value: _homeCubit,
            child: BlocListener<NetworkCubit, NetworkState>(
              listener: (context, state) {
                state.whenOrNull(
                  connected: () {
                    final isAlreadySuccess = _homeCubit.state.maybeWhen(
                      getCategoriesSuccess: (_) => true,
                      orElse: () => false,
                    );
                    if (!isAlreadySuccess && mounted) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) _homeCubit.getCategories();
                      });
                    }
                  },
                );
              },
              child: BlocBuilder<HomeCubit, HomeCubitState>(
                builder: (_, state) {
                  return state.maybeWhen(
                    getCategoriesLoading: () => _buildCategoriesShimmer(),

                    getCategoriesFailure: (message) => Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Insets.s20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                message,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getMediumStyle(
                                  color: ColorManager.error,
                                  fontsize: FontSize.s12.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            IconButton(
                              onPressed: () => _homeCubit.getCategories(),
                              icon: Icon(
                                Icons.refresh_rounded,
                                color: ColorManager.primary,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    getCategoriesSuccess: (categories) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: Insets.s20.w),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: Sizes.s14.w),
                      itemBuilder: (context, index) {
                        final isSelected = _selectedIndex == index;
                        return GestureWrapper(
                          onTap: () => setState(() => _selectedIndex = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.all(Insets.s4.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.s18.r),
                              border: Border.all(
                                color: isSelected
                                    ? ColorManager.primary.withValues(
                                        alpha: 0.4,
                                      )
                                    : Colors.transparent,
                                width: 1.5.w,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: ColorManager.primary.withValues(
                                          alpha: 0.12,
                                        ),
                                        blurRadius: 12,
                                        offset: const Offset(0, 5),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: CategoryItem(category: categories[index]),
                          ),
                        );
                      },
                    ),

                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 💎 زر الإجراءات العصري (Modern Chip Button)
  Widget _buildModernActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s12.w,
            vertical: Insets.s6.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.primary.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(Sizes.s20.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.12),
              width: 1.w,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14.sp, color: ColorManager.primary),
              SizedBox(width: 4.w),
              Text(
                label,
                style: getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontsize: FontSize.s12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🌟 هيكل الشيمر المطور
  Widget _buildCategoriesShimmer() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Insets.s20.w),
      itemCount: 6,
      separatorBuilder: (_, _) => SizedBox(width: Sizes.s14.w),
      itemBuilder: (_, _) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 72.h,
            width: 72.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.lightGrey.withValues(alpha: 0.2),
            ),
          ),
          SizedBox(height: Sizes.s8.h),
          Container(
            height: 10.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: ColorManager.lightGrey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(Sizes.s4.r),
            ),
          ),
        ],
      ),
    );
  }
}

// 🛠️ ودجيت مساعدة لسهولة التفاعل مع العناصر
class GestureWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const GestureWrapper({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: child);
  }
}
