import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomerAuthController extends GetxController {

  final baseUrl = 'https://nginx-proxy-server-production.up.railway.app';
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

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      print(response.body); // 👈 Esto te dirá exactamente qué devuelve el backend
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final box = GetStorage();
        box.write('accessToken', data['accessToken']);
        box.write('user', data['user']);

        Get.snackbar('Éxito', 'Registro correcto');
        Get.toNamed('/dashboard');
      } else {
        Get.snackbar('Error', data['message'] ?? 'Error en el registro');
      }
    } catch (e) {
      Get.snackbar('Error', 'Algo salió mal: $e');
    }

    isLoading.value = false;
  }

  void register() async {
    isLoading.value = true;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'role': 'buyer',
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final box = GetStorage();
        box.write('accessToken', data['accessToken']);
        box.write('user', data['user']);

        Get.snackbar('Éxito', 'Registro correcto');
        Get.toNamed('/dashboard');
      } else {
        Get.snackbar('Error', data['message'] ?? 'Error en el registro');
      }
    } catch (e) {
      Get.snackbar('Error', 'Algo salió mal: $e');
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