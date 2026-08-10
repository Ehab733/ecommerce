import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = getIt<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCubit.getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s16.w,
            vertical: Insets.s8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Featured",
                style: getBoldStyle(
                  color: Colors.black,
                  fontsize: FontSize.s18.sp,
                ),
              ),
              Row(
                children: [
                  _buildActionButton(
                    label: 'Sort',
                    icon: Icons.swap_vert_rounded,
                    onTap: () {},
                  ),
                  SizedBox(width: Sizes.s8.w),
                  _buildActionButton(
                    label: 'Filter',
                    icon: Icons.filter_alt_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: Sizes.s12.h),

        SizedBox(
          height: 95.h,
          child: BlocProvider(
            create: (context) => _homeCubit,
            child: BlocListener<NetworkCubit, NetworkState>(
              listener: (context, state) {
                state.whenOrNull(
                  connected: () {
                    final isAlreadySuccess = _homeCubit.state.maybeWhen(
                      getCategoriesSuccess: (_) => true,
                      orElse: () => false,
                    );
                    if (!isAlreadySuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _homeCubit.getCategories();
                      });
                    }
                  },
                  disConnected: () {
                    UiUtils.showMessage(context, 'No Internet Connection');
                  },
                );
              },
              child: BlocBuilder<HomeCubit, HomeCubitState>(
                builder: (_, state) {
                  return state.maybeWhen(
                    getCategoriesLoading: () =>
                        const Center(child: LoadingIndicator()),
                    getCategoriesFailure: (message) => Center(
                      child: Padding(
                        padding: EdgeInsets.all(Insets.s16.sp),
                        child: ErrorIndicator(errorMessage: message),
                      ),
                    ),
                    getCategoriesSuccess: (categories) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: Insets.s16.w),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: Sizes.s16.w),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return InkWell(
                          onTap: () {
                            context.push(Routes.products, extra: category);
                          },
                          borderRadius: BorderRadius.circular(50.r),
                          child: Column(
                            children: [
                              Container(
                                width: 62.w,
                                height: 62.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    category.image,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              color: Colors.grey.shade200,
                                              child: Icon(
                                                Icons.category_outlined,
                                                color: Colors.grey,
                                                size: 24.sp,
                                              ),
                                            ),
                                  ),
                                ),
                              ),
                              SizedBox(height: Sizes.s4.h),
                              Text(
                                category.name,
                                style: getMediumStyle(
                                  color: const Color(0xFF212121),
                                  fontsize: FontSize.s11.sp,
                                ),
                              ),
                            ],
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

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Sizes.s4.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s8.w,
          vertical: Insets.s4.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.s4.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              label,
              style: getRegularStyle(
                color: Colors.black,
                fontsize: FontSize.s12.sp,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(icon, size: 14.sp, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
