import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 32.w,
        height: 32.h,
        child: const CircularProgressIndicator(
          color: ColorManager.primary,
          strokeWidth: 3.0,
          strokeCap: StrokeCap.round, // حواف أنيقة ودائرية لمؤشر التحميل
        ),
      ),
    );
  }
}
