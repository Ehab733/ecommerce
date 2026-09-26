import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InStoreOffersScreen extends StatelessWidget {
  const InStoreOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة العروض والفروع المتاحة بنفس الهوية البصرية للمشروع
    final List<Map<String, dynamic>> offersList = [
      {
        'title': 'In-Store Privilege Discount',
        'category': 'EXCLUSIVE',
        'code': 'BRANCH20',
        'validity': 'ساري حتى نهاية الشهر',
        'description':
            'استمتع بخصم فوري عند إظهار هذا الكود عند الدفع في أي فرع من فروعنا.',
        'branches': 'القاهرة، الجيزة، الإسكندرية',
      },
      {
        'title': 'Complimentary Gift Offer',
        'category': 'LIMITED',
        'code': 'GIFT2026',
        'validity': 'متاح في أيام الإجازات فقط',
        'description':
            'اشتري بأكثر من 1000 جنيه من أقرب فرع ليك واحصل على هدية فورية.',
        'branches': 'جميع الفروع الرئيسية',
      },
      {
        'title': 'First-Visit Welcome Perk',
        'category': 'SPECIAL',
        'code': 'WELCOMESTORE',
        'validity': 'ساري لفترة محدودة',
        'description':
            'زورنا لأول مرة في أي فرع واحصل على خصم خاص على إجمالي فاتورتك.',
        'branches': 'فرع المعادي ومدينة نصر',
      },
    ];

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(Insets.s8.r),
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.04),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorManager.textPrimary,
              size: Sizes.s16.sp,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'In-Store Offers & Privileges',
          style: getBoldStyle(
            color: ColorManager.textPrimary,
            fontsize: FontSize.s16.sp,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s20.w,
          vertical: Insets.s16.h,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: offersList.length,
        itemBuilder: (context, index) {
          final offer = offersList[index];
          return Container(
            margin: EdgeInsets.only(bottom: Insets.s16.h),
            padding: EdgeInsets.all(Insets.s20.r),
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
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ترويسة العرض (التصنيف ووقت الصلاحية)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.s8.w,
                        vertical: Insets.s4.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                      ),
                      child: Text(
                        offer['category'],
                        style: getBoldStyle(
                          color: ColorManager.primary,
                          fontsize: FontSize.s10.sp,
                        ),
                      ),
                    ),
                    Text(
                      offer['validity'],
                      style: getMediumStyle(
                        color: ColorManager.grey,
                        fontsize: FontSize.s11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Sizes.s12.h),

                // عنوان العرض
                Text(
                  offer['title'],
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s16.sp,
                  ),
                ),
                SizedBox(height: Sizes.s8.h),

                // وصف العرض
                Text(
                  offer['description'],
                  style: getRegularStyle(
                    color: ColorManager.grey,
                    fontsize: FontSize.s13.sp,
                  ).copyWith(height: 1.4),
                ),
                SizedBox(height: Sizes.s14.h),

                // الفروع المتاحة
                Row(
                  children: [
                    Icon(
                      Icons.store_mall_directory_rounded,
                      color: ColorManager.primary,
                      size: Sizes.s16.sp,
                    ),
                    SizedBox(width: Sizes.s8.w),
                    Expanded(
                      child: Text(
                        'الفروع المتاحة: ${offer['branches']}',
                        style: getMediumStyle(
                          color: ColorManager.textPrimary,
                          fontsize: FontSize.s12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Sizes.s16.h),

                // صندوق الكود وزر النسخ بستايل متناسق تماماً مع التطبيق
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Insets.s16.w,
                    vertical: Insets.s12.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(Sizes.s14.r),
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.1),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.confirmation_number_outlined,
                            color: ColorManager.primary,
                            size: Sizes.s18.sp,
                          ),
                          SizedBox(width: Sizes.s12.w),
                          Text(
                            offer['code'],
                            style: getBoldStyle(
                              color: ColorManager.primary,
                              fontsize: FontSize.s14.sp,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: offer['code']));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: ColorManager.textPrimary,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.s12.r,
                                ),
                              ),
                              content: Text(
                                'تم نسخ كود العرض بنجاح',
                                style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontsize: FontSize.s12.sp,
                                ),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Insets.s10.w,
                            vertical: Insets.s6.h,
                          ),
                          child: Text(
                            'نسخ الرمز',
                            style: getBoldStyle(
                              color: ColorManager.primary,
                              fontsize: FontSize.s12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
