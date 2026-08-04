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
                padding: const EdgeInsets.all(16.0),
                child: ErrorIndicator(errorMessage: message),
              ),
            ),

            orElse: () {
              if (_wishlistCubit.items.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: Sizes.s60.sp,
                          color: ColorManager.lightGrey,
                        ),
                        SizedBox(height: Sizes.s12.h),
                        Text(
                          'Your wishlist is empty',
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

              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = _wishlistCubit.items[index];
                    return WishlistCard(
                      key: ValueKey(item.id),
                      item: item,
                      onTap: () {
                        _wishlistCubit.deleteProductFromWishList(item.id);
                      },
                    );
                  }, childCount: _wishlistCubit.items.length),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
