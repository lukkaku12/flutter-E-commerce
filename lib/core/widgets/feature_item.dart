import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
