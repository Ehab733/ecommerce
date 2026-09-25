import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/bottom_bar.dart';
import 'package:ecommerce/core/widgets/custom_header.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _cartCubit.getCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FF),
      appBar: customHeader(title: 'My Cart', leading: false),
      body: Stack(
        children: [
          // 🎨 1. توهج خفيف في الخلفية لإضفاء الطابع الفاخر
          Positioned(
            top: -80.h,
            right: -50.w,
            child: Container(
              width: 240.w,
              height: 240.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary.withValues(alpha: 0.06),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.1),
                    blurRadius: 70,
                    spreadRadius: 15,
                  ),
                ],
              ),
            ),
          ),

          // 2. المحتوى ومستمعات الحالة
          MultiBlocListener(
            listeners: [
              // 🌐 متابعة حالة الاتصال بالشبكة
              BlocListener<NetworkCubit, NetworkState>(
                listener: (context, state) {
                  state.whenOrNull(
                    connected: () {
                      final isAlreadySuccess = _cartCubit.state.maybeWhen(
                        getCartSuccess: () => true,
                        orElse: () => false,
                      );
                      if (!isAlreadySuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _cartCubit.getCart();
                        });
                      }
                    },
                    disConnected: () {
                      UiUtils.showMessage(context, 'No Internet Connection');
                    },
                  );
                },
              ),

              // 🛒 الاستماع لأخطاء التحديث والحذف
              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  state.whenOrNull(
                    updateCartError: (message) {
                      UiUtils.showMessage(context, message, isError: true);
                    },
                    deleteFromCartError: (message) {
                      UiUtils.showMessage(context, message, isError: true);
                    },
                  );
                },
              ),
            ],
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Insets.s20.w,
                    vertical: Insets.s16.h,
                  ),
                  sliver: BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) {
                      return current.maybeWhen(
                        getCartLoading: () => true,
                        getCartError: (_) => true,
                        getCartSuccess: () => true,
                        updateCartSuccess: () => true,
                        deleteFromCartSuccess: () => true,
                        orElse: () => false,
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        // ⏳ حالة التحميل الأولي
                        getCartLoading: () => const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: LoadingIndicator()),
                        ),

                        // ❌ حالة الخطأ
                        getCartError: (errorMessage) => SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(Insets.s16.r),
                              child: ErrorIndicator(errorMessage: errorMessage),
                            ),
                          ),
                        ),

                        // ✅ عرض القائمة
                        orElse: () {
                          final items = _cartCubit.cart.products;

                          // 🛒 السلة فارغة بتصميم أنيق ومجسم
                          if (items.isEmpty) {
                            return SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(Insets.s24.r),
                                      decoration: BoxDecoration(
                                        color: ColorManager.primary.withValues(
                                          alpha: 0.08,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.remove_shopping_cart_outlined,
                                        size: Sizes.s40.r,
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                    SizedBox(height: Sizes.s20.h),
                                    Text(
                                      'Your cart is empty',
                                      style: getBoldStyle(
                                        color: ColorManager.textPrimary,
                                        fontsize: FontSize.s18.sp,
                                      ),
                                    ),
                                    SizedBox(height: Sizes.s8.h),
                                    Text(
                                      'Looks like you haven\'t added anything yet',
                                      style: getRegularStyle(
                                        color: ColorManager.textSecondary,
                                        fontsize: FontSize.s13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final item = items[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: Insets.s14.h),
                                child: CartItemCard(
                                  cartItemData: item,
                                  onIncrement: () {
                                    _cartCubit.updateCart(
                                      item.product.id,
                                      item.count + 1,
                                    );
                                  },
                                  onDecrement: () {
                                    if (item.count > 1) {
                                      _cartCubit.updateCart(
                                        item.product.id,
                                        item.count - 1,
                                      );
                                    }
                                  },
                                  onDelete: () {
                                    _cartCubit.deleteFromCart(item.product.id);
                                  },
                                ),
                              );
                            }, childCount: items.length),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // 💳 Bottom Bar لتصفية الحساب بتصميم عصري
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final items = _cartCubit.cart.products;
          if (items.isNotEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s20.w,
                vertical: Insets.s12.h,
              ),
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: BottomBar(
                  totalPrice: "EGP ${_cartCubit.cart.totalCartPrice}",
                  onClicked: () {},
                  title: 'Check Out',
                  iconTrailing: Icons.arrow_forward_rounded,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
