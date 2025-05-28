import 'package:e_commerce_app/features/auth/vendor/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpVendorView extends StatelessWidget {
  const SignUpVendorView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorAuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Registrarse como Vendedor',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo Electrónico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: controller.register,
                              child: const Text('Crear Cuenta'),
                            ),
                          ),
                  ),

                  const SizedBox(height: 16),
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿Ya tienes cuenta? '),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/user/sign-in-vendor');
                        },
                        child: const Text(
                          'Inicia sesión',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: () {
                      Get.offAllNamed('/');
                    },
                    child: const Text('← Volver atrás'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
