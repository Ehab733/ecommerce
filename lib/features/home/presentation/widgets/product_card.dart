// lib/features/home/presentation/widgets/product_card.dart
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF004182), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الصورة + أيقونة القلب
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(13),
                ),
                child: Image.network(
                  "data:image/jpeg;base64,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", // استبدلها بصورة المنتج
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              const Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    color: Color(0xFF004182),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          // 2. تفاصيل المنتج
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nike Air",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 5),
                const Text(
                  "EGP 1200",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004182),
                  ),
                ),

                // 3. التقييم وزر الإضافة
                Row(
                  children: [
                    const Text("Review (4.8)"),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Spacer(),
                    const Icon(
                      Icons.add_circle,
                      color: Color(0xFF004182),
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
