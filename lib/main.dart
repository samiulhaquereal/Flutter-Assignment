import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:softbd/src/config/imports.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: tButtonBackgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  await initializeDateFormatting('bn_BD', null);
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        navigatorKey: RetCoreNavigatorKey,
        title: 'Flutter Assignment',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: tPrimaryColor),
          useMaterial3: true,
        ),
        initialBinding: RouteBinding(),
        initialRoute: RoutesClass.getLoginRoute(),
        getPages: RoutesClass.routes,
        builder: EasyLoading.init(),
        home: DashboardScreen(),
      ),
    );
  }
}