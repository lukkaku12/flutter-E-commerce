import 'package:get/get.dart';

class LandingController extends GetxController {
  var counter = 0.obs; // .obs lo hace reactivo

  void increment() => counter++;
  void reset() => counter.value = 0;
}