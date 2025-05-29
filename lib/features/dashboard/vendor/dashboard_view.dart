import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDashboardView extends StatelessWidget {
  const VendorDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'product_id': 1,
        'brand': 'Sony',
        'base_model': 'Alpha 7',
        'gtin': '1234567890',
        'price': 1999.99,
      },
    ];

    final services = [
      {
        'service_id': 1,
        'service_name': 'Reparación de cámaras',
        'service_description': 'Servicio técnico especializado',
        'service_price': 150,
        'serviceSchedule': [
          {
            'schedule_date': '2025-06-01',
            'start_time': '09:00',
            'ending_time': '10:00',
            'isAvailable': true,
          },
          {
            'schedule_date': '2025-06-01',
            'start_time': '10:00',
            'ending_time': '11:00',
            'isAvailable': false,
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Vendedor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Get.offAllNamed('/'),
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botones de acción
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed('/product/create-product'),
                  icon: const Icon(Icons.add),
                  label: const Text('Crear producto'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed('/service/create-service'),
                  icon: const Icon(Icons.build),
                  label: const Text('Crear servicio'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              'Mis productos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Lista de productos
            products.isEmpty
                ? const Text(
                    'No tienes productos registrados.',
                    style: TextStyle(color: Colors.grey),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          onTap: () => Get.toNamed(
                            '/product/vendor/${product['product_id']}',
                          ),
                          title: Text(
                            '${product['brand']} - ${product['base_model']}',
                          ),
                          subtitle: Text('GTIN: ${product['gtin']}'),
                          trailing: Text('\$${product['price']}'),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 30),
            const Text(
              'Mis servicios',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Lista de servicios
            services.isEmpty
                ? const Text(
                    'No tienes servicios registrados.',
                    style: TextStyle(color: Colors.grey),
                  )
                : ListView.builder(
                    itemCount: services.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      final schedule =
                          (service['serviceSchedule'] ?? []) as List;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          onTap: () => Get.toNamed(
                            '/service/vendor/${service['service_id']}',
                          ),
                          title: Text(
                            service['service_name']?.toString() ?? '',
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service['service_description']?.toString() ??
                                    '',
                              ),
                              Text('Precio: \$${service['service_price']}'),
                              if (schedule.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    const Text(
                                      '📅 Próximas citas:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    ...schedule.take(2).map((sched) {
                                      return Text(
                                        '${sched['schedule_date']} - ${sched['start_time']} a ${sched['ending_time']} '
                                        '${sched['isAvailable'] ? '✅ Disponible' : '❌ Ocupado'}',
                                        style: TextStyle(
                                          color: sched['isAvailable']
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                            ],
                          ),
                          isThreeLine: true,
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
