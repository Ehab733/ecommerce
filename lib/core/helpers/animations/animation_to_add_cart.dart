import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedAddToCartButton extends StatefulWidget {
  final String productId;

  const AnimatedAddToCartButton({super.key, required this.productId});

  @override
  State<AnimatedAddToCartButton> createState() =>
      _AnimatedAddToCartButtonState();
}

class _AnimatedAddToCartButtonState extends State<AnimatedAddToCartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.35,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _triggerSuccessAnimation() async {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });

    await _controller.forward();
    await _controller.reverse();

    await Future.delayed(const Duration(milliseconds: 1200));

    // 🛡️ التأكد من أن الـ Widget ما زال معروضاً قبل استدعاء setState
    if (mounted) {
      setState(() {
        _isSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) {
        return current.maybeWhen(
          addToCartLoading: (productId) => productId == widget.productId,
          addToCartSuccess: (productId) => productId == widget.productId,
          addToCartError: (errorMessage, productId) =>
              productId == widget.productId,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          addToCartLoading: (_) {
            if (mounted) setState(() => _isLoading = true);
          },
          addToCartError: (_, _) {
            if (mounted) setState(() => _isLoading = false);
          },
          addToCartSuccess: (_) => _triggerSuccessAnimation(),
        );
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // لضمان الاستجابة السريعة للمس
        onTap: () {
          if (!_isLoading && !_isSuccess) {
            context.read<CartCubit>().addToCart(widget.productId);
          }
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: _isLoading
                ? SizedBox(
                    key: ValueKey('loading_${widget.productId}'),
                    width: 22.w,
                    height: 22.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.w,
                      color: ColorManager.primary,
                    ),
                  )
                : _isSuccess
                ? Icon(
                    Icons.check_circle_rounded,
                    key: ValueKey('success_${widget.productId}'),
                    color: Colors.green,
                    size: 24.sp,
                  )
                : Icon(
                    Icons.add_circle,
                    key: ValueKey('add_${widget.productId}'),
                    color: ColorManager.primary,
                    size: 24.sp,
                  ),
          ),
        ),
      ),
    );
  }
}
