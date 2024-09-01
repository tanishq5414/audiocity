import 'package:get/get.dart';
import 'package:psventuresassignment/features/navigation/navigation_controller.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}