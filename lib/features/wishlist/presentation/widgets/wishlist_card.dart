import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistCard extends StatelessWidget {
  final WishlistItem item;
  final VoidCallback? onTap;

  const WishlistCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      margin: EdgeInsets.only(bottom: Insets.s16.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(Sizes.s20.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.08),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // 1️⃣ صورة المنتج بتصميم فاخر وإطار داخلي ناعم
          Padding(
            padding: EdgeInsets.all(Insets.s8.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.s16.r),
              child: SizedBox(
                width: 105.w,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: item.imageCover,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: ColorManager.primary.withValues(alpha: 0.04),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: ColorManager.primary.withValues(alpha: 0.06),
                    child: Icon(
                      Icons.broken_image_rounded,
                      color: ColorManager.primary.withValues(alpha: 0.5),
                      size: Sizes.s28.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2️⃣ تفاصيل المنتج جهة اليمين
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: Insets.s10.h,
                bottom: Insets.s10.h,
                right: Insets.s12.w,
                left: Insets.s4.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // الصف الأول: عنوان المنتج + زر الإزالة من المفضلة بتصميم دقيق
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textPrimary,
                            fontsize: FontSize.s14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: Insets.s8.w),

                      // أيقونة القلب للإزالة المظللة بإضاءة خفيفة
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                          borderRadius: BorderRadius.circular(Sizes.s20.r),
                          child: Container(
                            padding: EdgeInsets.all(Insets.s6.r),
                            decoration: BoxDecoration(
                              color: ColorManager.error.withValues(alpha: 0.06),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite_rounded,
                              color: ColorManager.error,
                              size: Sizes.s14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // الصف الثاني: مؤشر اللون والمواصفات الخفيفة
                  Row(
                    children: [
                      Container(
                        width: Sizes.s12.r,
                        height: Sizes.s12.r,
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.white,
                            width: 1.5.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Insets.s6.w),
                      Text(
                        'Signature Edition',
                        style: getMediumStyle(
                          color: ColorManager.grey,
                          fontsize: FontSize.s11.sp,
                        ),
                      ),
                    ],
                  ),

                  // الصف الثالث: السعر المميز + زر إضافة للسلة متحرك
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "EGP ${item.price.toInt()}",
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: FontSize.s14.sp,
                        ),
                      ),

                      // 🎯 الزر المتحرك التفاعلي المتناسق
                      _AnimatedAddToCartButton(productId: item.id),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Component الزر المتحرك (Micro-interaction Button) بستايل عصري
// ---------------------------------------------------------------------------
class _AnimatedAddToCartButton extends StatefulWidget {
  final String productId;

  const _AnimatedAddToCartButton({required this.productId});

  @override
  State<_AnimatedAddToCartButton> createState() =>
      _AnimatedAddToCartButtonState();
}

class _AnimatedAddToCartButtonState extends State<_AnimatedAddToCartButton> {
  bool _isPressed = false;
  bool _isAdded = false;

  Future<void> _handleTap() async {
    if (_isAdded) return;

    setState(() => _isPressed = true);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _isPressed = false);

    if (mounted) {
      context.read<CartCubit>().addToCart(widget.productId);
    }

    setState(() => _isAdded = true);

    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _isAdded = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.94 : 1.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      child: SizedBox(
        height: Sizes.s32.h,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.s14.r),
            boxShadow: _isAdded
                ? []
                : [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
          ),
          child: ElevatedButton(
            onPressed: _handleTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isAdded
                  ? ColorManager.success
                  : ColorManager.primary,
              foregroundColor: ColorManager.white,
              padding: EdgeInsets.symmetric(horizontal: Insets.s12.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.s14.r),
              ),
              elevation: 0,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: _isAdded
                  ? Row(
                      key: const ValueKey('added_state'),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_rounded,
                          color: ColorManager.white,
                          size: Sizes.s14.sp,
                        ),
                        SizedBox(width: Insets.s4.w),
                        Text(
                          "Added",
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontsize: FontSize.s11.sp,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "Add to Cart",
                      key: const ValueKey('normal_state'),
                      style: getBoldStyle(
                        color: ColorManager.white,
                        fontsize: FontSize.s11.sp,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
