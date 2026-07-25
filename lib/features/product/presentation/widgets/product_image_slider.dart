import 'package:ecommerce/core/resources/color_manager.dart';
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
    const darkBlueColor = Color(0xFF003F6F);

    return Stack(
      alignment: Alignment.center,
      children: [
        // 1️⃣ حاوية الصور مع إمكانية التمرير Afik
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.isEmpty ? 1 : widget.images.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                if (widget.images.isEmpty) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: Colors.grey,
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: LoadingIndicator());
                    },
                    errorBuilder: (_, _, _) => Center(
                      child: Icon(
                        Icons.broken_image_rounded,
                        size: 40,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // 2️⃣ زر إضافة/حذف من المفضلة (Favorite Button)
        Positioned(
          top: 16.h,
          right: 16.w,
          child: GestureDetector(
            onTap: widget.onFavoriteTap,
            child: Container(
              height: 36.r,
              width: 36.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.black.withAlpha(200),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20.r,
                color: ColorManager.primary,
              ),
            ),
          ),
        ),

        // 3️⃣ مؤشر الصفحات السلس (Animated Page Indicators)
        Positioned(
          bottom: 16.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.isEmpty ? 1 : widget.images.length,
              (index) {
                final bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: isActive ? 24.w : 6.r,
                  height: 6.r,
                  decoration: BoxDecoration(
                    color: isActive ? darkBlueColor : Colors.white,
                    border: Border.all(color: darkBlueColor, width: 1.r),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
