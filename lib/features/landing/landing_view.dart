
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/widgets/feature_item.dart';
import 'package:e_commerce_app/core/widgets/tech_chip.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF00C6FF), // #00c6ff
                    Color(0xFF0072FF), // #0072ff
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Mercatify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'API modular para construir tu propio eCommerce con facilidad.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed('/user/signup-client'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Vincularse como Cliente',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => Get.toNamed('/user/signup-vendor'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Vincularse como Vendedor'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FEATURES SECTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    '¿Qué ofrece Mercatify?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FeatureItem(
                        title: '🧱 Arquitectura Modular',
                        description:
                            'Desarrollado con NestJS, ideal para escalar sin dolores de cabeza.',
                      ),
                      FeatureItem(
                        title: '💳 Pagos con Mercado Pago',
                        description:
                            'Listo para que tus clientes paguen de forma segura y rápida.',
                      ),
                      FeatureItem(
                        title: '⚙️ Despliegue Automático',
                        description:
                            'CI/CD con GitHub Actions y Docker para actualizaciones fluidas.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // STACK SECTION
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const Text(
                    '⚙️ Stack Tecnológico',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: const [
                      TechChip(label: 'Node.js'),
                      TechChip(label: 'NestJS'),
                      TechChip(label: 'TypeScript'),
                      TechChip(label: 'Redis'),
                      TechChip(label: 'Mercado Pago'),
                      TechChip(label: 'Jest'),
                      TechChip(label: 'Docker'),
                      TechChip(label: 'GitHub Actions'),
                    ],
                  ),
                ],
              ),
            ),

            // FOOTER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: const Text(
                '© 2025 Mercatify. Todos los derechos reservados.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
