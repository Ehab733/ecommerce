import 'package:ecommerce/core/helpers/animations/repeating_letter_assembling_animation.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFF03E51);

    return Scaffold(
      body: Stack(
        children: [
          // 1️⃣ صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/get_started_bg.png', // مسار صورة الخلفية
              fit: BoxFit.cover,
            ),
          ),

          // 2️⃣ تدرج ظلي لشفافية النص
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.85),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // 3️⃣ المحتوى والأنيميشن للـ Text والـ Button
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s24.w,
                vertical: Insets.s24.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // 🌟 أنيميشن تجمع النص من الجوانب
                  const RepeatingLetterAssemblingAnimation(
                    text: 'You want\nAuthentic, here\nyou go!',
                  ),

                  SizedBox(height: Sizes.s12.h),

                  // النص الفرعي
                  Text(
                    'Find it here, buy it now!',
                    textAlign: TextAlign.center,
                    style: getRegularStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontsize: FontSize.s14,
                    ),
                  ),

                  SizedBox(height: Sizes.s32.h),

                  // زر Get Started
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryRed,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s12.r),
                        ),
                      ),
                      onPressed: () async {
                        EasyLoading.show(
                          status: 'Loading...',
                          dismissOnTap: false,
                          maskType: EasyLoadingMaskType.black,
                          options: EasyLoadingOptions(userInteractions: false),
                        );
                        await Future.delayed(const Duration(seconds: 2));
                        // ignore: use_build_context_synchronously
                        await EasyLoading.dismiss();
                        if (context.mounted) {
                          context.go(Routes.home);
                        }
                      },
                      child: Text(
                        'Get Started',
                        style: getBoldStyle(
                          color: Colors.white,
                          fontsize: FontSize.s20,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: Sizes.s12.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
