import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/core/widgets/custom_search.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/product_cart.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/product/presentation/manager/product_cubit.dart';
import 'package:ecommerce/features/product/presentation/manager/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class ProductScreen extends StatelessWidget {
  final Category category;
  const ProductScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Logger().d('Category ID: ${category.id}');

    return BlocProvider(
      create: (context) => getIt.get<ProductCubit>()..getProducts(category.id),
      child: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          state.whenOrNull(
            connected: () {
              final productCubit = context.read<ProductCubit>();
              final isAlreadySuccess = productCubit.state.maybeWhen(
                success: (_) => true,
                orElse: () => false,
              );
              if (!isAlreadySuccess) {
                productCubit.getProducts(category.id);
              }
            },
            disConnected: () =>
                UiUtils.showMessage(context, 'No Internet Connection'),
          );
        },
        child: Scaffold(
          appBar: customHeader(title: category.name, leading: false),
          backgroundColor: const Color(0xFFFAF9FF), // خلفية فاخرة وناعمة
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 🔍 1. شريط البحث المثبت (Sticky Search Bar)
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 0.0,
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 70.h,
                backgroundColor: const Color(0xFFFAF9FF),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.s4.w),
                  child: customSearch(),
                ),
                automaticallyImplyLeading: false,
              ),

              // 📊 2. شريط عدد المنتجات وأزرار Sort & Filter الفاخرة
              SliverToBoxAdapter(
                child: BlocBuilder<ProductCubit, GetProductState>(
                  builder: (context, state) {
                    final int count = state.maybeWhen(
                      success: (products) => products.length,
                      orElse: () => 0,
                    );

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.s20.w,
                        vertical: Insets.s10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // عدد العناصر المصنفة بوزن خطي أنيق
                          Text(
                            "$count+ Items",
                            style: getBoldStyle(
                              color: ColorManager.textPrimary,
                              fontsize: FontSize.s16.sp,
                            ),
                          ),

                          // أزرار Sort & Filter العصرية
                          Row(
                            children: [
                              _buildActionButton(
                                label: 'Sort',
                                icon: Icons.swap_vert_rounded,
                                onTap: () {},
                              ),
                              SizedBox(width: Sizes.s12.w),
                              _buildActionButton(
                                label: 'Filter',
                                icon: Icons.filter_alt_outlined,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 📦 3. شبكة عرض المنتجات والحالات الخاصة
              SliverPadding(
                padding: EdgeInsets.only(
                  left: Insets.s20.w,
                  right: Insets.s20.w,
                  top: Insets.s8.h,
                  bottom: MediaQuery.paddingOf(context).bottom + Insets.s24.h,
                ),
                sliver: BlocBuilder<ProductCubit, GetProductState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: LoadingIndicator()),
                      ),
                      error: (message) => SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(Insets.s16.r),
                            child: ErrorIndicator(errorMessage: message),
                          ),
                        ),
                      ),
                      success: (products) {
                        if (products.isEmpty) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(Insets.s20.r),
                                    decoration: BoxDecoration(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.05,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.inventory_2_outlined,
                                      size: Sizes.s40.sp,
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Sizes.s14.h),
                                  Text(
                                    'No products available for this category',
                                    textAlign: TextAlign.center,
                                    style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontsize: FontSize.s13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.72,
                                mainAxisSpacing: Insets.s16.h,
                                crossAxisSpacing: Insets.s14.w,
                              ),
                          delegate: SliverChildBuilderDelegate(
                            (_, index) => InkWell(
                              borderRadius: BorderRadius.circular(Sizes.s20.r),
                              onTap: () {
                                Logger().d(products[index].title);
                                context.push(
                                  Routes.productsDetails,
                                  extra: products[index],
                                );
                              },
                              child: ProductCard(product: products[index]),
                            ),
                            childCount: products.length,
                          ),
                        );
                      },
                      orElse: () =>
                          const SliverToBoxAdapter(child: SizedBox.shrink()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🛠️ ودجت أنيقة ومحدثة لأزرار Sort و Filter بتصميم Minimal Luxury
  static Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Sizes.s14.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.s12.w,
            vertical: Insets.s8.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(Sizes.s14.r),
            border: Border.all(
              color: ColorManager.primary.withValues(alpha: 0.1),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                label,
                style: getBoldStyle(
                  color: ColorManager.textPrimary,
                  fontsize: FontSize.s12.sp,
                ),
              ),
              SizedBox(width: Insets.s6.w),
              Icon(icon, size: Sizes.s14.sp, color: ColorManager.primary),
            ],
          ),
        ),
      ),
    );
  }
}
