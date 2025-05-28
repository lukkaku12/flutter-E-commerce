import 'package:e_commerce_app/features/auth/customer/login_customer.dart';
import 'package:e_commerce_app/features/auth/customer/signup_customer.dart';
import 'package:e_commerce_app/features/auth/vendor/login_vendor.dart';
import 'package:e_commerce_app/features/auth/vendor/signup_vendor.dart';
import 'package:e_commerce_app/features/landing/landing_view.dart';
import 'package:get/get.dart';
import '../features/dashboard/dashboard_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LandingPage()),
    GetPage(name: '/dashboard', page: () => const DashboardView()),
    GetPage(name: '/user/signup-client', page: () => const SignupCustomerView()),
    GetPage(name: '/user/signup-vendor', page: () => const SignUpVendorView()),
    GetPage(name: '/user/sign-in-client', page: () => const LoginCustomerView()),
    GetPage(name: '/user/sign-in-vendor', page: () => const LoginVendorView()),
    // Agregá más rutas aquí fácilmente
  ];
}