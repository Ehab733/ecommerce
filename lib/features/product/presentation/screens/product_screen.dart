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
          backgroundColor: ColorManager.white,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 🔍 1. شريط البحث المثبت (Sticky Search Bar)
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 0.0,
                surfaceTintColor: Colors.white,
                toolbarHeight: 64.h,
                backgroundColor: ColorManager.white,
                title: customSearch(context),
                automaticallyImplyLeading: false,
              ),

              // 📊 2. شريط عدد المنتجات وأزرار Sort & Filter (مطابق للصورة)
              SliverToBoxAdapter(
                child: BlocBuilder<ProductCubit, GetProductState>(
                  builder: (context, state) {
                    final int count = state.maybeWhen(
                      success: (products) => products.length,
                      orElse: () => 0,
                    );

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.s16.w,
                        vertical: Insets.s8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // عدد العناصر المصنفة
                          Text(
                            "$count+ Items",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontsize: FontSize.s18.sp,
                            ),
                          ),

                          // أزرار Sort & Filter
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
                    );
                  },
                ),
              ),

              // 📦 3. شبكة عرض المنتجات والحالات الخاصة
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 8.h,
                  bottom: MediaQuery.paddingOf(context).bottom + 20.h,
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
                        Logger().d("Products count: ${products.length}");

                        // 📭 حالة عدم وجود منتجات داخل القائمة
                        if (products.isEmpty) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.inventory_2_outlined,
                                    size: Sizes.s60.sp,
                                    color: ColorManager.lightGrey,
                                  ),
                                  SizedBox(height: Sizes.s12.h),
                                  Text(
                                    'No products available for this category',
                                    textAlign: TextAlign.center,
                                    style: getMediumStyle(
                                      color: ColorManager.grey,
                                      fontsize: FontSize.s14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        // 🛍️ العرض الشبكي للمنتجات
                        return SliverGrid(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                0.75, // نسبة تناسب مثالية لكارت التصميم (صورة + عنوان + وصف + سعر + تقييم)
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 14.w,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (_, index) => InkWell(
                              onTap: () => context.push(
                                Routes.productsDetails,
                                extra: products[index],
                              ),
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

  // 🛠️ ودجت أنيقة لمظهر أزرار Sort و Filter
  static Widget _buildActionButton({
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
              color: Colors.black.withAlpha(12),
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
