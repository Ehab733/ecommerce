import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> images;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const ProductImageSlider({
    super.key,
    required this.images,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9FF), // خلفية ناعمة وفاخرة
        borderRadius: BorderRadius.circular(Sizes.s24.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.08),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s24.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1️⃣ عرض الصور مع التمرير الأفقي
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.isEmpty ? 1 : widget.images.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                if (widget.images.isEmpty) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      size: Sizes.s40.r,
                      color: ColorManager.grey,
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Insets.s24.w,
                    vertical: Insets.s20.h,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.images[index],
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const Center(child: LoadingIndicator()),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.broken_image_rounded,
                        size: Sizes.s40.r,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                );
              },
            ),

            // 2️⃣ زر المفضلة (Favorite Button) بتصميم عصري عائم
            Positioned(
              top: Insets.s16.h,
              right: Insets.s16.w,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onFavoriteTap,
                  borderRadius: BorderRadius.circular(Sizes.s20.r),
                  child: Container(
                    height: Sizes.s40.r,
                    width: Sizes.s40.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                      border: Border.all(
                        color: ColorManager.primary.withValues(alpha: 0.1),
                        width: 1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.black.withValues(alpha: 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        widget.isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: Sizes.s20.r,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3️⃣ مؤشر الصفحات السلس والمضيء (Animated Page Indicators)
            if (widget.images.length > 1)
              Positioned(
                bottom: Insets.s16.h,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Insets.s10.w,
                    vertical: Insets.s6.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(Sizes.s16.r),
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.08),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.images.length, (index) {
                      final bool isActive = index == _currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.symmetric(horizontal: Insets.s4.w),
                        width: isActive ? Sizes.s20.w : Sizes.s8.r,
                        height: Sizes.s8.r,
                        decoration: BoxDecoration(
                          color: isActive
                              ? ColorManager.primary
                              : ColorManager.primary.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(Sizes.s4.r),
                        ),
                      );
                    }),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
