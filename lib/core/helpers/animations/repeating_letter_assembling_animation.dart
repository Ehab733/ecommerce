import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🎬 ودجت مخصصة لتحريك النص وتجميعه من الجوانب بمرونة عالية
class RepeatingLetterAssemblingAnimation extends StatefulWidget {
  final String text;

  const RepeatingLetterAssemblingAnimation({
    super.key,
    required this.text,
  });

  @override
  State<RepeatingLetterAssemblingAnimation> createState() =>
      _RepeatingLetterAssemblingAnimationState();
}

class _RepeatingLetterAssemblingAnimationState
    extends State<RepeatingLetterAssemblingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<String> _characters;

  @override
  void initState() {
    super.initState();
    _characters = widget.text.split('');
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _characters.length * 80 + 1500),
    );

    // تكرار الانيميشن باستمرار مع إعادة التشغيل تلقائياً (Looping)
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        int charIndexCounter = 0;

        // تقطيع النص بناءً على السطور لضمان تحكم سليم في الـ Alignment
        final lines = widget.text.split('\n');

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: lines.map((line) {
            final lineChars = line.split('');

            return Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(lineChars.length, (i) {
                final char = lineChars[i];
                final currentIndex = charIndexCounter++;

                // حساب التتابع الزمني لظهور كل حرف على حدة (Staggered Effect)
                final double start = (currentIndex / _characters.length) * 0.6;
                final double end = (start + 0.3).clamp(0.0, 1.0);

                final double charProgress = CurvedAnimation(
                  parent: _controller,
                  curve: Interval(start, end, curve: Curves.easeOutBack),
                ).value;

                // تبديل اتجاه الدخول (يمين / يسار) للحروف
                final double direction = (currentIndex % 2 == 0) ? -1.0 : 1.0;
                final double offsetX = (1.0 - charProgress) * (120.0 * direction);
                final double offsetY = (1.0 - charProgress) * -30.0;

                if (char == ' ') {
                  return SizedBox(width: 8.w);
                }

                return Transform.translate(
                  offset: Offset(offsetX, offsetY),
                  child: Opacity(
                    opacity: charProgress.clamp(0.0, 1.0),
                    child: Text(
                      char,
                      style: getBoldStyle(
                        color: Colors.white,
                        fontsize: FontSize.s32,
                      ).copyWith(height: 1.2),
                    ),
                  ),
                );
              }),
            );
          }).toList(),
        );
      },
    );
  }
}