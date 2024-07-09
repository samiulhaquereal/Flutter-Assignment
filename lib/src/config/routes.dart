import 'package:softbd/src/config/imports.dart';

class RoutesClass {

  static String _loginPage="/";


  static String getLoginRoute()=>_loginPage;


  static List<GetPage> routes = [
    GetPage(name: _loginPage, page: ()=>const LoginScreen()),
  ];

}