import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int _selectedIndex = 1;

  final List<CategoryModel> _categories = [
    const CategoryModel(name: "Men's Fashion", subcategories: []),
    const CategoryModel(
      name: "Women's Fashion",
      subcategories: [
        SubcategoryModel(title: "Dresses", imagePath: "assets/images/dresses.png"),
        SubcategoryModel(title: "Jeans", imagePath: "assets/images/jeans.png"),
        SubcategoryModel(title: "skirts", imagePath: "assets/images/skirts.png"),
        SubcategoryModel(title: "pijamas", imagePath: "assets/images/pijamas.png"),
        SubcategoryModel(title: "Bags", imagePath: "assets/images/bags.png"),
        SubcategoryModel(title: "T-shirts", imagePath: "assets/images/tshirts.png"),
        SubcategoryModel(title: "Footwear", imagePath: "assets/images/footwear.png"),
        SubcategoryModel(title: "Eyewear", imagePath: "assets/images/eyewear.png"),
        SubcategoryModel(title: "Watches", imagePath: "assets/images/watches.png"),
      ],
    ),
    const CategoryModel(name: "Skincare", subcategories: []),
    const CategoryModel(name: "Beauty", subcategories: []),
    const CategoryModel(name: "Headphones", subcategories: []),
    const CategoryModel(name: "Cameras", subcategories: []),
    const CategoryModel(name: "Laptops & Electronics", subcategories: []),
    const CategoryModel(name: "Baby & Toys", subcategories: []),
  ];

  @override
  Widget build(BuildContext context) {
    // 🎯 حساب الارتفاع الصافي المتاح للـ Tab فقط داخل الشاشة
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    // تخصيم ارتفاع الـ Top Header والـ SearchBar والـ BottomNav (حوالي 210)
    final double tabContentHeight = screenHeight - statusBarHeight - 210.h;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: tabContentHeight, // 👈 إعطاء ارتفاع محدد لمنع الـ CustomScrollView الخارجي من سحب الشاشة
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===============================================================
            // 1️⃣ Left Side: Categories List (Scroll مستقل 100%)
            // ===============================================================
            Expanded(
              flex: 3,
              child: Container(
                color: ColorManager.primary.withAlpha(12),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(), // شغال لوحده
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedIndex;
                    return InkWell(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        height: 56.h,
                        color: isSelected ? Colors.white : Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              width: 5.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? ColorManager.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(4.r),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                _categories[index].name,
                                style: isSelected
                                    ? getBoldStyle(
                                        color: ColorManager.primary,
                                        fontsize: 13.sp,
                                      )
                                    : getMediumStyle(
                                        color: ColorManager.primary,
                                        fontsize: 13.sp,
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
                color: Colors.white,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 16.h),
                  physics: const BouncingScrollPhysics(), // شغال لوحده
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        _categories[_selectedIndex].name,
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // البنر
                      _buildCategoryBanner(),
                      SizedBox(height: 14.h),

                      // الشبكة
                      _buildSubcategoriesGrid(
                        _categories[_selectedIndex].subcategories,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBanner() {
    return Container(
      height: 105.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Women's\nFashion",
              style: getBoldStyle(
                color: ColorManager.primary,
                fontsize: 15.sp,
              ),
            ),
            SizedBox(height: 6.h),
            SizedBox(
              height: 26.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Shop Now',
                  style: getRegularStyle(
                    color: ColorManager.white,
                    fontsize: 11.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubcategoriesGrid(List<SubcategoryModel> subcategories) {
    if (subcategories.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Center(
          child: Text(
            'No subcategories available',
            style: getMediumStyle(
              color: ColorManager.primary.withAlpha(120),
              fontsize: 13.sp,
            ),
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
        childAspectRatio: 0.75,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        final item = subcategories[index];
        return Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: getMediumStyle(
                color: ColorManager.primary,
                fontsize: 11.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}

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