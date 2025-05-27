// lib/features/profile/profile_view.dart
import 'package:e_commerce_app/features/auth/customer/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCustomerView extends StatelessWidget {
  SignupCustomerView({super.key});

  final controller = Get.put(CustomerAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse (Cliente)')),
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
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
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
                    onPressed: controller.register,
                    child: const Text('Registrarse'),
                  )),
          ],
        ),
      ),
    );
  }
}
