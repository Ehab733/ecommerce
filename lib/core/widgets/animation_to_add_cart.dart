import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedAddToCartButton extends StatefulWidget {
  final String productId;

  const AnimatedAddToCartButton({super.key, required this.productId});

  @override
  State<AnimatedAddToCartButton> createState() =>
      _ProductCardAddToCartButtonState();
}

class _ProductCardAddToCartButtonState extends State<AnimatedAddToCartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
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

  void _triggerSuccessAnimation() async {
    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });

    await _controller.forward();
    await _controller.reverse();

    await Future.delayed(const Duration(milliseconds: 1200));
    if (mounted) {
      setState(() {
        _isSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      // 🎯 أهم نقطة (Senior Filter): الفلترة يدوياً بـ listenWhen
      listenWhen: (previous, current) {
        if (current is AddToCartLoading &&
            current.productId == widget.productId) {
          return true;
        }
        if (current is AddToCartSuccess &&
            current.productId == widget.productId) {
          return true;
        }
        if (current is AddToCartError &&
            current.productId == widget.productId) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is AddToCartLoading) {
          setState(() => _isLoading = true);
        } else if (state is AddToCartError) {
          setState(() => _isLoading = false);
        } else if (state is AddToCartSuccess) {
          _triggerSuccessAnimation();
        }
      },
      child: GestureDetector(
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
                    Icons.check_circle,
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
