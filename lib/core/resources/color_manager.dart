import 'package:flutter/material.dart';

abstract class ColorManager {
  const ColorManager._();

  // ---------------------------------------------------------------------------
  // 🔴 Primary & Brand Colors (الهوية الجديدة: أحمر وردي وألوان مكملة)
  // ---------------------------------------------------------------------------
  static const Color primary = Color(
    0xFFF03E51,
  ); // الأحمـر الرئيسي الناصع للبراند
  static const Color primaryDark = Color(
    0xFFD02E40,
  ); // أحمر أغمق للحالات التفاعلية
  static const Color darkBlue = Color(
    0xFF17223B,
  ); // كحلي غامق للـ Indicators والأزرار النشطة
  static const Color darkPrimary = Color(
    0xFF17223B,
  ); // متوافق مع العناوين والـ Indicators
  static const Color lightPrimary = Color(
    0xFFFCF3F4,
  ); // خلفية وردية ناعمة لأزرار السوشيال

  // ---------------------------------------------------------------------------
  // ⚪ Text & Typography Colors (نصوص متناسقة مع التصميم)
  // ---------------------------------------------------------------------------
  static const Color text = Color(0xFF000000); // أسود ناصع للعناوين الرئيسية
  static const Color appBarTitle = Color(0xFF000000);

  // ---------------------------------------------------------------------------
  // 🔘 Greys & Neutral Colors (درجات رمادي ناعمة مطابقة للفرونت)
  // ---------------------------------------------------------------------------
  static const Color darkGrey = Color(0xFF575757); // نصوص وصفية جانبية
  static const Color grey = Color(
    0xFFA8A8A9,
  ); // رمادي للنصوص الثانوية والـ Progress
  static const Color lightGrey = Color(
    0xFFC4C4C4,
  ); // رمادي فاتح للأزرار غير المفعلة (Disabled)
  static const Color grey1 = Color(0xFFE0E0E0); // خطوط فاصلة و Indicators خاملة
  static const Color grey2 = Color(0xFFF4F4F4); // خلفية حقول الإدخال الفاتحة
  static const Color containerGray = Color(0xFFF9F9F9); // خلفية الكروت الفاتحة
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // ---------------------------------------------------------------------------
  // 🌟 Accent, Feedback & Status Colors (ألوان التقييم والتنبيهات)
  // ---------------------------------------------------------------------------
  static const Color yellow = Color(0xFFEDB310); // أصفر دافئ للتقييمات
  static const Color starRate = Color(0xFFEDB310);
  static const Color error = Color(0xFFF03E51); // أحمر البراند للأخطاء

  // ---------------------------------------------------------------------------
  // 🔮 Helpers & Overlays (مفيدة للـ Shimmer والـ UI)
  // ---------------------------------------------------------------------------
  static Color shimmerBase = const Color(0xFFE0E0E0);
  static Color shimmerHighlight = const Color(0xFFF5F5F5);
  static Color overlay = const Color(0xFF000000).withValues(alpha: 0.3);
}
