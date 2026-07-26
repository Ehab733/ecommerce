import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
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
    _wishlistCubit.getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 🎯 مرجع SliverPadding ليعمل بسلاسة كاملة داخل slivers: [...] بـ HomeScreen
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        if (state is GetWishListLoading) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: LoadingIndicator()),
          );
        } else if (state is GetWishListError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: ErrorIndicator(errorMessage: state.message),
          );
        } else {
          if (_wishlistCubit.items.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'No products are available for this wishlist',
                  style: getLightStyle(color: ColorManager.grey),
                ),
              ),
            );
          } else {
            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = _wishlistCubit.items[index];
                  return WishlistCard(
                    item: item,
                    onTap: () async {
                      _wishlistCubit.deleteProductFromWishList(item.id);
                      _wishlistCubit.getWishList();
                    },
                  );
                }, childCount: _wishlistCubit.items.length),
              ),
            );
          }
        }
      },
    );
  }
}
