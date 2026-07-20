import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFF004182)
            ),
          ),
          const Text(
            "view all", 
            style: TextStyle(
              fontSize: 14, 
              color: Color(0xFF004182)
            ),
          ),
        ],
      ),
    );
  }
}