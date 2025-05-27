import 'package:e_commerce_app/features/auth/customer/signup_customer.dart';
import 'package:e_commerce_app/features/auth/vendor/signup_vendor.dart';
import 'package:e_commerce_app/features/landing/landing_view.dart';
import 'package:get/get.dart';
import '../features/dashboard/dashboard_view.dart';

class AppRoutes {
  static final routes = <GetPage>[
    GetPage(name: '/', page: () => LandingPage()),
    GetPage(name: '/profile', page: () => const DashboardView()),
    GetPage(name: 'user/signup-client', page: () => SignupCustomerView()),
    GetPage(name: 'user/signup-vendor', page: () => SignUpVendorView()),
    // Agregá más rutas aquí fácilmente
  ];
}