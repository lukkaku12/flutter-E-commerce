
import 'package:flutter/material.dart';

class TechChip extends StatelessWidget {
  final String label;

  const TechChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}