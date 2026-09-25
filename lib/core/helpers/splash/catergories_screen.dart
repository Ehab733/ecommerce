import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int _selectedIndex = 1;

  final List<CategoryModel> _categories = const [
    CategoryModel(name: "Men's Fashion", subcategories: []),
    CategoryModel(
      name: "Women's Fashion",
      subcategories: [
        SubcategoryModel(
          title: "Dresses",
          imagePath: "assets/images/dresses.png",
        ),
        SubcategoryModel(title: "Jeans", imagePath: "assets/images/jeans.png"),
        SubcategoryModel(
          title: "Skirts",
          imagePath: "assets/images/skirts.png",
        ),
        SubcategoryModel(
          title: "Pijamas",
          imagePath: "assets/images/pijamas.png",
        ),
        SubcategoryModel(title: "Bags", imagePath: "assets/images/bags.png"),
        SubcategoryModel(
          title: "T-Shirts",
          imagePath: "assets/images/tshirts.png",
        ),
        SubcategoryModel(
          title: "Footwear",
          imagePath: "assets/images/footwear.png",
        ),
        SubcategoryModel(
          title: "Eyewear",
          imagePath: "assets/images/eyewear.png",
        ),
        SubcategoryModel(
          title: "Watches",
          imagePath: "assets/images/watches.png",
        ),
      ],
    ),
    CategoryModel(name: "Skincare", subcategories: []),
    CategoryModel(name: "Beauty", subcategories: []),
    CategoryModel(name: "Headphones", subcategories: []),
    CategoryModel(name: "Cameras", subcategories: []),
    CategoryModel(name: "Laptops & Tech", subcategories: []),
    CategoryModel(name: "Baby & Toys", subcategories: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===============================================================
            // 1️⃣ القائمة الجانبية للأقسام الرئيسية (Modern Minimal Sidebar)
            // ===============================================================
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F7FC),
                  border: Border(
                    right: BorderSide(
                      color: ColorManager.primary.withValues(alpha: 0.06),
                      width: 1.w,
                    ),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: Insets.s12.h,
                    horizontal: Insets.s6.w,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedIndex;
                    return Padding(
                      padding: EdgeInsets.only(bottom: Insets.s6.h),
                      child: InkWell(
                        onTap: () => setState(() => _selectedIndex = index),
                        borderRadius: BorderRadius.circular(Sizes.s14.r),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          padding: EdgeInsets.symmetric(
                            vertical: Insets.s12.h,
                            horizontal: Insets.s8.w,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorManager.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(Sizes.s14.r),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.06,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Row(
                            children: [
                              // مؤشر شريطي جانبي بتصميم ناعم
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: 3.5.w,
                                height: isSelected ? 20.h : 0.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.s4.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: isSelected ? Sizes.s8.w : Sizes.s4.w,
                              ),
                              Expanded(
                                child: Text(
                                  _categories[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: isSelected
                                      ? getBoldStyle(
                                          color: ColorManager.primary,
                                          fontsize: FontSize.s12.sp,
                                        )
                                      : getMediumStyle(
                                          color: ColorManager.grey,
                                          fontsize: FontSize.s11.sp,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ===============================================================
            // 2️⃣ منطقة عرض المحتوى والأقسام الفرعية (Subcategories & Banner)
            // ===============================================================
            Expanded(
              flex: 7,
              child: Container(
                color: ColorManager.white,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SingleChildScrollView(
                    key: ValueKey<int>(_selectedIndex),
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.s16.w,
                      vertical: Insets.s16.h,
                    ),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // اسم القسم المحدد
                        Text(
                          _categories[_selectedIndex].name,
                          style: getBoldStyle(
                            color: ColorManager.textPrimary,
                            fontsize: FontSize.s16.sp,
                          ),
                        ),
                        SizedBox(height: Insets.s12.h),

                        // البنر الإعلاني العائم بتصميم فاخر
                        _buildCategoryBanner(_categories[_selectedIndex].name),
                        SizedBox(height: Insets.s20.h),

                        // شبكة الأقسام الفرعية
                        _buildSubcategoriesGrid(
                          _categories[_selectedIndex].subcategories,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🖼️ ويدجيت البنر الإعلاني
  Widget _buildCategoryBanner(String categoryName) {
    return Container(
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s16.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.1),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageAssets.bannerImg,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: ColorManager.primary.withValues(alpha: 0.05),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: ColorManager.primary.withValues(alpha: 0.3),
                    size: 28.sp,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(Insets.s14.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    ColorManager.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    categoryName,
                    style: getBoldStyle(
                      color: ColorManager.white,
                      fontsize: FontSize.s14.sp,
                    ),
                  ),
                  SizedBox(height: Sizes.s8.h),
                  SizedBox(
                    height: 26.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: Insets.s12.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s14.r),
                        ),
                      ),
                      child: Text(
                        'Shop Now',
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontsize: FontSize.s10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔲 شبكة الأقسام الفرعية
  Widget _buildSubcategoriesGrid(List<SubcategoryModel> subcategories) {
    if (subcategories.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(Insets.s16.r),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withValues(alpha: 0.04),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.primary.withValues(alpha: 0.08),
                    width: 1.w,
                  ),
                ),
                child: Icon(
                  Icons.grid_view_rounded,
                  size: Sizes.s28.sp,
                  color: ColorManager.primary.withValues(alpha: 0.4),
                ),
              ),
              SizedBox(height: Sizes.s12.h),
              Text(
                'No subcategories found',
                style: getSemiBoldStyle(
                  color: ColorManager.grey,
                  fontsize: FontSize.s12.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subcategories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.76,
        crossAxisSpacing: Sizes.s12.w,
        mainAxisSpacing: Sizes.s12.h,
      ),
      itemBuilder: (context, index) {
        final item = subcategories[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(Sizes.s14.r),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F7FC),
                    borderRadius: BorderRadius.circular(Sizes.s14.r),
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.06),
                      width: 1.w,
                    ),
                  ),
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Center(
                      child: Icon(
                        Icons.checkroom_outlined,
                        color: ColorManager.primary.withValues(alpha: 0.4),
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.s8.h),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: getMediumStyle(
                  color: ColorManager.textPrimary,
                  fontsize: FontSize.s11.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// 📦 Data Models
class SubcategoryModel {
  final String title;
  final String imagePath;

  const SubcategoryModel({required this.title, required this.imagePath});
}

class CategoryModel {
  final String name;
  final List<SubcategoryModel> subcategories;

  const CategoryModel({required this.name, required this.subcategories});
}
