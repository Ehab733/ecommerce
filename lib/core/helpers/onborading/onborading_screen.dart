import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// موديل الـ Onboarding
class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // القائمة الكاملة للشاشات الثلاث
  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Choose Products',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Make Payment',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Get Your Order',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
  ];

  // 💡 حفظ حالة عدم إظهار الـ Onboarding مرة أخرى والانتقال للـ Login
  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
    if (mounted) {
      context.go(Routes.login);
    }
  }

  void _onSkip() {
    _finishOnboarding();
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _onPrev() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFF03E51);
    const Color textGrey = Color(0xFFA8A8A9);
    const Color disabledGrey = Color(0xFFC4C4C4);
    const Color activeIndicator = Color(0xFF17223B);

    final bool isLastPage = _currentIndex == _pages.length - 1;
    final bool isFirstPage = _currentIndex == 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1️⃣ الشريط العلوي: العداد (1/3, 2/3, 3/3) + زر Skip
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${_currentIndex + 1}',
                          style: getBoldStyle(
                            color: Colors.black,
                            fontsize: FontSize.s18,
                          ),
                        ),
                        TextSpan(
                          text: '/${_pages.length}',
                          style: getSemiBoldStyle(
                            color: textGrey,
                            fontsize: FontSize.s18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: _onSkip,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Skip',
                      style: getBoldStyle(
                        color: Colors.black,
                        fontsize: FontSize.s18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2️⃣ منطقة الصور والمحتوى الرئيسي
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.image,
                          height: MediaQuery.of(context).size.height * 0.35,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 36),
                        Text(
                          item.title,
                          style: getBoldStyle(
                            color: Colors.black,
                            fontsize: FontSize.s24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item.description,
                          style: getRegularStyle(
                            color: textGrey,
                            fontsize: FontSize.s14,
                          ).copyWith(height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // 3️⃣ الشريط السفلي: (Prev) + (Indicators) + (Next / Get Started)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر Prev
                  TextButton(
                    onPressed: isFirstPage ? null : _onPrev,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(60, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Prev',
                      style: getSemiBoldStyle(
                        color: isFirstPage ? disabledGrey : textGrey,
                        fontsize: FontSize.s18,
                      ),
                    ),
                  ),

                  // الـ Page Indicator التفاعلي المتحرك
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.0,
                        width: _currentIndex == index ? 40.0 : 8.0,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? activeIndicator
                              : const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),

                  // زر Next أو Get Started
                  TextButton(
                    onPressed: _onNext,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(60, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      isLastPage ? 'Get Started' : 'Next',
                      style: getBoldStyle(
                        color: primaryRed,
                        fontsize: FontSize.s18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
