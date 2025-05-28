// lib/features/profile/profile_view.dart
import 'package:e_commerce_app/features/auth/vendor/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVendorView extends StatelessWidget {
  const LoginVendorView({super.key});


  @override
  Widget build(BuildContext context) {
  final controller = Get.put(VendorAuthController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Bienvenido de nuevo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Iniciar sesión'),
                  )),
          ],
        ),
      ),
    );
  }
}
