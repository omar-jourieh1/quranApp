import 'package:aqra/core/routes/routes.dart';
import 'package:aqra/features/quran_view_page/quran_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aqra/features/home/ui/home_page.dart';

import 'features/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return MaterialApp(
          initialRoute: Routes.homePage,
showPerformanceOverlay: true,          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.black,
                  backgroundColor:  Colors.grey[100],),
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.grey[100],
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.grey[100],
              secondary: Color(0xff44BDA8),
              
            ),
           
          ),
         
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
