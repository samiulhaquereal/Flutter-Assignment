import 'package:softbd/src/config/imports.dart';

class DashboardController extends GetxController{
  RxInt myIndex = 0.obs;
  List<Widget> screenList = [ HomeScreen(), CalenderScreen()];
}