import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDashboardView extends StatelessWidget {
  const CustomerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'gtin': '123456789',
        'mpn': 'ABC-123',
        'brand': 'MarcaX',
        'base_model': 'ModeloX',
      },
      // más productos...
    ];

    final List<Map<String, String>> services = [
      {
        'service_name': 'Instalación',
        'service_description': 'Instalamos tu producto.',
      },
      // más servicios...
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Get.toNamed('/cart'),
            color: Colors.black,
          ),
          
          PopupMenuButton<String>(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onSelected: (value) {
              if (value == 'logout') Get.offAllNamed('/');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido, Cliente',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 🔍 BUSCADOR
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar productos o servicios...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                // TODO: Implementar búsqueda
              },
            ),

            const SizedBox(height: 30),

            // 📦 SECCION PRODUCTOS
            const Text(
              'Productos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            products.isEmpty
                ? const Text('No hay productos disponibles.')
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed('/product/${product['gtin']}'),
                        child: Card(
                          color: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['gtin'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('MPN: ${product['mpn']}'),
                                Text('Marca: ${product['brand']}'),
                                Text('Modelo: ${product['base_model']}'),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () => print(
                                    'Agregar ${product['gtin']} al carrito',
                                  ),
                                  child: const Text('Agregar al carrito'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 30),

            // 🛠 SERVICIOS
            const Text(
              'Servicios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            services.isEmpty
                ? const Text('No hay servicios disponibles.')
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return Card(
                        color: Colors.blue.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(service['service_name'] ?? ''),
                          subtitle: Text(service['service_description'] ?? ''),
                          trailing: ElevatedButton(
                            onPressed: () =>
                                print('Reservar ${service['service_name']}'),
                            child: const Text('Solicitar'),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
