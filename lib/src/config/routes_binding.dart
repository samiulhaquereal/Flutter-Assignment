import 'package:softbd/src/config/imports.dart';

class RouteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}