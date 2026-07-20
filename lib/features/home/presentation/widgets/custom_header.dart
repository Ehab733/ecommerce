import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // اللوجو (يمكن استبداله بـ Image.asset)
          const Text(
            "Route",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004182),
            ),
          ),
          const SizedBox(height: 10),
          // حقل البحث مع أيقونة البحث
          Row(
            children: [
              Expanded(
                child: TextFormFieldEdit(
                  controller: TextEditingController(),
                  label: 'what do you search for?',
                ),
              ),
              const SizedBox(width: 10),
              // أيقونة السلة بجانب الحقل
              const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF004182),
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
