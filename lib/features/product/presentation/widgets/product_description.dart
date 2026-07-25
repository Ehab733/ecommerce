import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: getMediumStyle(
            color: ColorManager.text,
            fontsize: FontSize.s18,
          ),
        ),
        SizedBox(height: 8.h),

        // تحول سلس بين النص المبتور والنص الكامل
        AnimatedCrossFade(
          firstChild: Text(
            widget.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle(
              color: ColorManager.text.withAlpha(150),
              fontsize: FontSize.s14,
            ),
          ),
          secondChild: Text(
            widget.description,
            style: getRegularStyle(
              color: ColorManager.text.withAlpha(150),
              fontsize: FontSize.s14,
            ),
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),

        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Text(
              _isExpanded ? 'Read Less' : 'Read More',
              style: getRegularStyle(
                color: ColorManager.text,
                fontsize: FontSize.s14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
