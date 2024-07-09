import 'package:softbd/src/config/imports.dart';

class RoutesClass {

  static String _loginPage="/";
  static String _addNewPage="/addNew";


  static String getLoginRoute()=>_loginPage;
  static String getAddNewRoute()=>_addNewPage;


  static List<GetPage> routes = [
    GetPage(name: _loginPage, page: ()=>const DashboardScreen()),
    GetPage(name: _addNewPage, page: ()=>const AddNewScreen()),
  ];

}