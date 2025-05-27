// lib/features/profile/profile_view.dart
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Column(
        children: [
          Text('Título'),
          ElevatedButton(onPressed: () {}, child: Text('Botón')),
        ],
      ),
    );
  }
}
