import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/bottom_bar.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final _cartCubit = context.read<CartCubit>();

  @override
  void initState() {
    _cartCubit.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customHeader(title: 'Cart'),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1️⃣ SliverAppBar متناسق مع باقي شاشات التطبيق

          // 2️⃣ قائمة منتجات السلة
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            sliver: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetCartLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: LoadingIndicator()),
                  );
                } else if (state is GetCartError) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorIndicator(errorMessage: state.message),
                  );
                } else {
                  Logger().d("Products count: ${_cartCubit.cart.items.length}");

                  // 2️⃣ التعامل مع حالة عدم وجود منتجات
                  if (_cartCubit.cart.items.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          'No products are available for this cart',
                          style: getLightStyle(color: ColorManager.grey),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = _cartCubit.cart.items[index];
                      int quantity = item.count;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: CartItemCard(
                          cartItemData: item,
                          onIncrement: () {
                            quantity++;
                            _cartCubit.updateCart(item.product.id, quantity);
                          },
                          onDecrement: () {
                            if (quantity > 1) {
                              quantity--;
                              _cartCubit.updateCart(item.product.id, quantity);
                            }
                          },
                          onDelete: () {
                            _cartCubit.deleteFromCart(item.product.id);
                            // _cartCubit.getCart();
                          },
                        ),
                      );
                    }, childCount: _cartCubit.cart.items.length),
                  );
                }
              },
            ),
          ),
        ],
      ),

      // 3️⃣ الشريط السفلي لإتمام الشراء
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          // طالما مش في مرحلة التحميل الأولي أو الخطأ، ولسه فيه منتجات
          if (state is! GetCartLoading &&
              state is! GetCartError &&
              _cartCubit.cart.items.isNotEmpty) {
            return BottomBar(
              totalPrice: _cartCubit.cart.totalCartPrice.toString(),
              onClicked: () {},
              title: 'Check Out',
              iconTrailing: Icons.arrow_forward,
            );
          }

          // تختفي فقط لو السلة أصبحت صفر منتجات أو أثناء التحميل الأولي
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
