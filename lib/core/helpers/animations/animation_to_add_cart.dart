import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
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
      duration: const Duration(milliseconds: 220),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.25,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
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

    await Future.delayed(const Duration(milliseconds: 1000));

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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (!_isLoading && !_isSuccess) {
              context.read<CartCubit>().addToCart(widget.productId);
            }
          },
          borderRadius: BorderRadius.circular(Sizes.s50.r),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(Insets.s6.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isSuccess ? ColorManager.success : ColorManager.primary,
                boxShadow: [
                  BoxShadow(
                    color:
                        (_isSuccess
                                ? ColorManager.success
                                : ColorManager.primary)
                            .withValues(alpha: 0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: _isLoading
                    ? SizedBox.square(
                        key: ValueKey('loading_${widget.productId}'),
                        dimension: 18.r,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          color: ColorManager.white,
                        ),
                      )
                    : _isSuccess
                    ? Icon(
                        Icons.check_rounded,
                        key: ValueKey('success_${widget.productId}'),
                        color: ColorManager.white,
                        size: 18.sp,
                      )
                    : Icon(
                        Icons.add_shopping_cart_rounded,
                        key: ValueKey('add_${widget.productId}'),
                        color: ColorManager.white,
                        size: 18.sp,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
