import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;

  late AnimationController _textController;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _navigateToNextScreen();
  }

  void _initAnimation() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    _logoRotationAnimation = Tween<double>(begin: 0.0, end: 1.25).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.85, curve: Curves.easeInOutCubic),
      ),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlideAnimation =
        Tween<Offset>(
          begin: const Offset(-0.25, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    _logoController.forward().then((_) {
      if (mounted) _textController.forward();
    });
  }

  // 3️⃣ التوجيه الذكي: Onboarding -> Login -> Home
  Future<void> _navigateToNextScreen() async {
    final results = await Future.wait([
      SharedPreferences.getInstance(),
      Future.delayed(const Duration(milliseconds: 2600)),
    ]);

    if (!mounted) return;

    final prefs = results[0] as SharedPreferences;

    // التحقق هل فتح التطبيق لأول مرة أم لا
    final isFirstTime = prefs.getBool('is_first_time') ?? true;
    final token = prefs.getString(CasheConstants.tokenKey);
    final hasToken = token != null && token.isNotEmpty;

    if (mounted) {
      if (isFirstTime) {
        // إذا كانت أول مرة، توجيه للـ Onboarding
        context.go(Routes.onboarding);
      } else {
        // إذا ليست المرة الأولى، توجيه حسب التوكن
        context.go(hasToken ? Routes.getStartd : Routes.login);
      }
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color logoRed = Color(0xFFF03E51);
    const Color logoBlue = Color(0xFF3384FD);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _logoScaleAnimation.value,
                  child: Transform.rotate(
                    angle: _logoRotationAnimation.value * 3.14159 * 2,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: const BoxDecoration(
                                color: logoBlue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: logoRed,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 6,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
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

            const SizedBox(width: 16),

            FadeTransition(
              opacity: _textFadeAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: Text(
                  'Stylish',
                  style: getBoldStyle(
                    color: logoRed,
                    fontsize: FontSize.s32,
                  ).copyWith(fontFamily: 'serif', letterSpacing: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
