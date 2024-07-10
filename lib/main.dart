import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: tButtonBackgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ));
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