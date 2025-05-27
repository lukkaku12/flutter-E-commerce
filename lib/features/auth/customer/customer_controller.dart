import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomerAuthController extends GetxController {
  // Campos de texto
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  // Estado de carga
  var isLoading = false.obs;

  // Función de login
  void login() async {
    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text;

    await Future.delayed(const Duration(seconds: 2)); // Simular API

    // Validación simple de ejemplo
    if (email == 'cliente@demo.com' && password == '123456') {
      Get.snackbar('Éxito', 'Inicio de sesión correcto');
      Get.toNamed('/dashboard'); // Ruta destino después del login
    } else {
      Get.snackbar('Error', 'Credenciales inválidas');
    }

    isLoading.value = false;
  }

  void register() async {
    isLoading.value = true;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    await Future.delayed(const Duration(seconds: 2)); // Simular API

    // Validación simple de ejemplo
    if (email == 'cliente@demo.com' && password == '123456' && name == 'pepito') {
      Get.snackbar('Éxito', 'registro correcto');
      Get.toNamed('/dashboard'); // Ruta destino después del login
    } else {
      Get.snackbar('Error', 'Credenciales inválidas');
    }

    isLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}