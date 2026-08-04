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
    // 💡 إرجاع Row مباشر مع Expanded لضمان ملء الشاشة بدون أخطاء Slivers
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===============================================================
        // 1️⃣ Left Side: Categories List (Scroll مستقل 100%)
        // ===============================================================
        Expanded(
          flex: 3,
          child: Container(
            color: ColorManager.containerGray,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: Insets.s8.h),
              physics: const BouncingScrollPhysics(),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedIndex;
                return InkWell(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 56.h,
                    color: isSelected ? ColorManager.white : Colors.transparent,
                    child: Row(
                      children: [
                        // 📍 الشريط الجانبي الفعال (Selected Indicator Bar)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 6.w,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorManager.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Sizes.s4.r),
                              bottomRight: Radius.circular(Sizes.s4.r),
                            ),
                          ),
                        ),
                        SizedBox(width: Sizes.s8.w),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: Insets.s4.w),
                            child: Text(
                              _categories[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: isSelected
                                  ? getBoldStyle(
                                      color: ColorManager.primary,
                                      fontsize: FontSize.s13,
                                    )
                                  : getMediumStyle(
                                      color: ColorManager.grey,
                                      fontsize: FontSize.s13,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // ===============================================================
        // 2️⃣ Right Side: Subcategories Area (Scroll مستقل 100%)
        // ===============================================================
        Expanded(
          flex: 7,
          child: Container(
            color: ColorManager.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s12.w,
                vertical: Insets.s8.h,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عنوان القسم المختار
                  Text(
                    _categories[_selectedIndex].name,
                    style: getBoldStyle(
                      color: ColorManager.text,
                      fontsize: FontSize.s16,
                    ),
                  ),
                  SizedBox(height: Sizes.s12.h),

                  // بنر التخفيضات الخاص بالقسم
                  _buildCategoryBanner(_categories[_selectedIndex].name),
                  SizedBox(height: Sizes.s16.h),

                  // شبكة الأقسام الفرعية
                  _buildSubcategoriesGrid(
                    _categories[_selectedIndex].subcategories,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 🖼️ ويدجيت البنر الإعلاني
  Widget _buildCategoryBanner(String categoryName) {
    return Container(
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s12.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(Insets.s12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.s12.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ColorManager.black.withValues(alpha: 0.4), Colors.transparent],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categoryName,
              style: getBoldStyle(
                color: ColorManager.white,
                fontsize: FontSize.s14,
              ),
            ),
            SizedBox(height: Sizes.s4.h),
            SizedBox(
              height: 28.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: Insets.s12.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.s8.r),
                  ),
                ),
                child: Text(
                  'Shop Now',
                  style: getMediumStyle(
                    color: ColorManager.white,
                    fontsize: FontSize.s11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔲 ويدجيت شبكة الأقسام الفرعية (Subcategories Grid)
  Widget _buildSubcategoriesGrid(List<SubcategoryModel> subcategories) {
    if (subcategories.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.category_outlined,
                size: Sizes.s40.sp,
                color: ColorManager.lightGrey,
              ),
              SizedBox(height: Sizes.s8.h),
              Text(
                'No subcategories available',
                style: getMediumStyle(
                  color: ColorManager.grey,
                  fontsize: FontSize.s13,
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
        childAspectRatio: 0.72,
        crossAxisSpacing: Sizes.s12.w,
        mainAxisSpacing: Sizes.s12.h,
      ),
      itemBuilder: (context, index) {
        final item = subcategories[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(Sizes.s12.r),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.containerGray,
                    borderRadius: BorderRadius.circular(Sizes.s12.r),
                    border: Border.all(color: ColorManager.grey2, width: 1.w),
                    image: DecorationImage(
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.s4.h),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: getMediumStyle(
                  color: ColorManager.text,
                  fontsize: FontSize.s12,
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
