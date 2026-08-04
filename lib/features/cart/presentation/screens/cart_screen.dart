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
      backgroundColor: ColorManager.white,
      appBar: customHeader(title: 'My Cart', leading: false),
      body: MultiBlocListener(
        listeners: [
          // 🌐 1. حالة الاتصال بالإنترنت
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

          // 🛒 2. الاستماع للأخطاء فقط عند فشل التحديث أو الحذف
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
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
                bottom: MediaQuery.paddingOf(context).bottom + 20.h,
              ),
              sliver: BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) {
                  return current.maybeWhen(
                    getCartLoading: () => true,
                    getCartError: (_) => true,
                    getCartSuccess: () => true,
                    updateCartSuccess: () =>
                        true, // ⚡ إعادة بناء الشاشة فورا عند النجاح
                    deleteFromCartSuccess: () =>
                        true, // ⚡ إزالة المنتج من الشاشة فوراً
                    orElse: () => false,
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    // ⏳ التحميل الأولي عند فتح الشاشة أول مرة فقط
                    getCartLoading: () => const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: LoadingIndicator()),
                    ),

                    // ❌ الخطأ الأولي
                    getCartError: (errorMessage) => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(Insets.s16.r),
                          child: ErrorIndicator(errorMessage: errorMessage),
                        ),
                      ),
                    ),

                    // ✅ عرض المنتجات والتحديث/الحذف اللحظي
                    orElse: () {
                      var items = _cartCubit.cart.products;

                      // 🛒 حالة السلة فارغة
                      if (items.isEmpty) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.remove_shopping_cart_outlined,
                                  size: Sizes.s60.sp,
                                  color: ColorManager.lightGrey,
                                ),
                                SizedBox(height: Sizes.s12.h),
                                Text(
                                  'Your cart is empty',
                                  style: getBoldStyle(
                                    color: ColorManager.text,
                                    fontsize: FontSize.s18,
                                  ),
                                ),
                                SizedBox(height: Sizes.s4.h),
                                Text(
                                  'Looks like you haven\'t added anything yet',
                                  style: getRegularStyle(
                                    color: ColorManager.grey,
                                    fontsize: FontSize.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = items[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
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

      // 💳 Bottom Bar يتحديث اللحظي لخصم السعر عند حذف المنتجات أو تقليل الكمية
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final items = _cartCubit.cart.products;
          if (items.isNotEmpty) {
            return BottomBar(
              totalPrice: "EGP ${_cartCubit.cart.totalCartPrice}",
              onClicked: () {},
              title: 'Check Out',
              iconTrailing: Icons.arrow_forward_rounded,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
