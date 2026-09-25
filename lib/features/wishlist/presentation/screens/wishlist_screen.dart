import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_state.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  late final _wishlistCubit = context.read<WishListCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_wishlistCubit.items.isEmpty) {
        _wishlistCubit.getWishList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NetworkCubit, NetworkState>(
          listener: (context, state) {
            state.whenOrNull(
              connected: () {
                if (_wishlistCubit.items.isEmpty) {
                  _wishlistCubit.getWishList();
                }
              },
              disConnected: () =>
                  UiUtils.showMessage(context, 'No Internet Connection'),
            );
          },
        ),
        BlocListener<WishListCubit, WishListState>(
          listener: (context, state) {
            state.whenOrNull(
              deleteProductFromWishListError: (message) {
                UiUtils.showMessage(context, message, isError: true);
              },
              deleteProductFromWishListSuccess: () {
                UiUtils.showMessage(context, 'Item removed successfully');
              },
            );
          },
        ),
      ],
      child: BlocBuilder<WishListCubit, WishListState>(
        buildWhen: (previous, current) {
          return current.maybeWhen(
            getWishListLoading: () => true,
            getWishListError: (_) => true,
            getWishListSuccess: () => true,
            deleteProductFromWishListSuccess: () => true,
            addProductToWishListSuccess: () => true,
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getWishListLoading: () => const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: LoadingIndicator()),
            ),
            getWishListError: (message) => SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all(Insets.s20.r),
                child: ErrorIndicator(errorMessage: message),
              ),
            ),
            orElse: () {
              if (_wishlistCubit.items.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.s32.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // أيقونة الحالة الفارغة مصممة بإطار ناعم
                          Container(
                            padding: EdgeInsets.all(Insets.s24.r),
                            decoration: BoxDecoration(
                              color: ColorManager.primary.withValues(
                                alpha: 0.04,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.primary.withValues(
                                  alpha: 0.08,
                                ),
                                width: 1.w,
                              ),
                            ),
                            child: Icon(
                              Icons.favorite_border_rounded,
                              size: Sizes.s40.sp,
                              color: ColorManager.primary.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                          SizedBox(height: Insets.s20.h),
                          Text(
                            'Your wishlist is empty',
                            style: getBoldStyle(
                              color: ColorManager.textPrimary,
                              fontsize: FontSize.s18.sp,
                            ),
                          ),
                          SizedBox(height: Insets.s8.h),
                          Text(
                            'Discover and save your favorite luxury items to view them later.',
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              color: ColorManager.grey,
                              fontsize: FontSize.s13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s20.w,
                  vertical: Insets.s16.h,
                ),
                sliver: SliverList.builder(
                  itemCount: _wishlistCubit.items.length,
                  itemBuilder: (context, index) {
                    final item = _wishlistCubit.items[index];
                    return Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: EdgeInsets.only(bottom: Insets.s16.h),
                        decoration: BoxDecoration(
                          color: ColorManager.error.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(Sizes.s20.r),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.error.withValues(alpha: 0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: Insets.s24.w),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: ColorManager.white,
                          size: Sizes.s24.sp,
                        ),
                      ),
                      onDismissed: (_) {
                        _wishlistCubit.deleteProductFromWishList(item.id);
                      },
                      child: WishlistCard(
                        item: item,
                        onTap: () {
                          _wishlistCubit.deleteProductFromWishList(item.id);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
