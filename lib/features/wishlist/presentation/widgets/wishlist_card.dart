import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
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
      height: 115.h,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withAlpha(50), width: 1),
      ),
      child: Row(
        children: [
          // 1️⃣ صورة المنتج جهة اليسار
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
              width: 115.w,
              height: double.infinity,
              color: Colors.grey.shade100,
              child: Image.network(
                item.imageCover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: ColorManager.primary.withAlpha(20),
                  child: Icon(
                    Icons.image,
                    color: ColorManager.primary,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ),

          // 2️⃣ تفاصيل المنتج جهة اليمين
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // الصف الأول: عنوان المنتج + زر الفافوريت (Heart)
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
                            color: ColorManager.primary,
                            fontsize: 14.sp,
                          ),
                        ),
                      ),

                      // أيقونة القلب
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: ColorManager.primary,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // الصف الثاني: دائرة اللون
                  Row(
                    children: [
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          color: ColorManager.darkPrimary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Dark Primary',
                        style: getMediumStyle(
                          color: ColorManager.primary.withAlpha(180),
                          fontsize: 12.sp,
                        ),
                      ),
                    ],
                  ),

                  // الصف الثالث: السعر + زر Add to Cart المتحرك
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${item.price.toInt()}",
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: 13.sp,
                        ),
                      ),

                      // 🎯 الزر المتحرك الذكي
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
// Component الزر المتحرك (Micro-interaction Button)
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
    if (_isAdded) return; // منع الضغط المتكرر أثناء إظهار تم الإضافة

    // 1️⃣ انقباظ الزر (Bounce effect)
    setState(() => _isPressed = true);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _isPressed = false);

    // 2️⃣ إرسال الطلب لـ Cubit
    if (mounted) {
      context.read<CartCubit>().addToCart(widget.productId);
    }

    // 3️⃣ تغيير حالة الزر إلى Added (لون أخضر + علامة صح)
    setState(() => _isAdded = true);

    // 4️⃣ العودة للحالة الأصلية بعد ثانية ونصف
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _isAdded = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.92 : 1.0, // انقباظ بسيط عند الضغط
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      child: SizedBox(
        height: 32.h,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: ElevatedButton(
            onPressed: _handleTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isAdded
                  ? Colors.green.shade600
                  : ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: _isPressed ? 0 : 2,
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
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Added",
                          style: getRegularStyle(
                            color: ColorManager.white,
                            fontsize: 11.sp,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "Add to Cart",
                      key: const ValueKey('normal_state'),
                      style: getRegularStyle(
                        color: ColorManager.white,
                        fontsize: 11.sp,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
