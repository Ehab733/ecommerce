import 'package:flutter/material.dart';

abstract class ColorManager {
  const ColorManager._();

  // ---------------------------------------------------------------------------
  // 🔵 Primary & Brand Colors (الهوية الجديدة: أزرق ملكي وبرتقالي للسرعة)
  // ---------------------------------------------------------------------------
  static const Color primary = Color(
    0xFF2A65EA,
  ); // الأزرق الرئيسي الناصع للبراند
  static const Color primaryDark = Color(
    0xFF1E429F,
  ); // أزرق أغمق للحالات التفاعلية
  static const Color secondary = Color(
    0xFFFF6B00,
  ); // برتقالي حركي للسرعة والتنبيهات
  static const Color darkBlue = Color(
    0xFF0F172A,
  ); // كحلي داكن ناعم خلفيات أو عناوين
  static const Color darkPrimary = Color(
    0xFF0F172A,
  ); // متوافق مع العناوين والـ Indicators
  static const Color lightPrimary = Color(
    0xFFEFF6FF,
  ); // خلفية زرقاء فاتحة للأزرار والبطاقات

  // ---------------------------------------------------------------------------
  // ⚪ Surface & Backgrounds (الخلفيات والبطاقات)
  // ---------------------------------------------------------------------------
  static const Color background = Color(0xFFFFFFFF); // خلفية التطبيق البيضاء
  static const Color surface = Color(0xFFFFFFFF); // خلفية البطاقات والأزرار
  static const Color containerGray = Color(0xFFF8FAFC); // خلفية الكروت الفاتحة

  // ---------------------------------------------------------------------------
  // 🔘 Text & Typography Colors (نصوص متناسقة مع حقول الإدخال والصفحات)
  // ---------------------------------------------------------------------------
  static const Color text = Color(0xFF0F172A); // نص أسود/كحلي ناصع
  static const Color textPrimary = Color(0xFF0F172A); // النص الأساسي
  static const Color textSecondary = Color(
    0xFF64748B,
  ); // النص الثانوي (رمادي أزرق ناعم)
  static const Color appBarTitle = Color(0xFF0F172A);

  // ---------------------------------------------------------------------------
  // 🔘 Greys, Borders & Neutral Colors (الحواف والمقسمات)
  // ---------------------------------------------------------------------------
  static const Color border = Color(0xFFE2E8F0); // حدود حقول الإدخال (Borders)
  static const Color darkGrey = Color(0xFF475569); // نصوص وصفية جانبية
  static const Color grey = Color(
    0xFF94A3B8,
  ); // رمادي للنصوص الثانوية والـ Progress
  static const Color lightGrey = Color(
    0xFFCBD5E1,
  ); // رمادي فاتح للأزرار غير المفعلة
  static const Color grey1 = Color(0xFFE2E8F0); // خطوط فاصلة
  static const Color grey2 = Color(0xFFF1F5F9); // خلفية حقول الإدخال الفاتحة
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // ---------------------------------------------------------------------------
  // 🌟 Accent, Feedback & Status Colors (ألوان التقييم والتنبيهات)
  // ---------------------------------------------------------------------------
  static const Color yellow = Color(0xFFF59E0B); // أصفر دافئ للتقييمات
  static const Color starRate = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444); // أحمر للخطأ فقط (Error State)
  static const Color success = Color(0xFF10B981); // أخضر للرسائل الناجحة

  // ---------------------------------------------------------------------------
  // 🔮 Helpers & Overlays (الشفافية والـ Shimmer)
  // ---------------------------------------------------------------------------
  static const Color shimmerBase = Color(0xFFE2E8F0);
  static const Color shimmerHighlight = Color(0xFFF8FAFC);
  static final Color overlay = const Color(0xFF0F172A).withValues(alpha: 0.3);
}
