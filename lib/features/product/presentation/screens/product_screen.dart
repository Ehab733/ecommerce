import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/widgets/custom_search.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/product_cart.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/features/product/presentation/manager/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context)!.settings.arguments as String;
    Logger().d(categoryId);
    return BlocProvider(
      create: (context) => getIt.get<ProductCubit>()..getProducts(categoryId),
      child: Scaffold(
        appBar: customHeader(),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 80.h,
              backgroundColor: ColorManager.white,
              title: customSearch(),

              automaticallyImplyLeading: false,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
              sliver: BlocBuilder<ProductCubit, GetProductState>(
                builder: (_, state) {
                  if (state is GetProductLoading) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: LoadingIndicator()),
                    );
                  } else if (state is GetProductError) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorIndicator(errorMessage: state.message),
                    );
                  } else if (state is GetProductSuccess) {
                    Logger().d("Products count: ${state.products.length}");

                    // 2️⃣ التعامل مع حالة عدم وجود منتجات
                    if (state.products.isEmpty) {
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'لا توجد منتجات متاحة لهذه الفئة',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      );
                    }
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // عمودين
                        childAspectRatio:
                            0.72, // الحفاظ على الأبعاد الصحيحة لمنع الـ Overflow
                        mainAxisSpacing: 16.r,
                        crossAxisSpacing: 16.r,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ProductCard(product: state.products[index]);
                        },
                        childCount: state.products.length, // عدد المنتجات
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
