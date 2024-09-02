import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/features/navigation/navigation_page.dart';
import 'package:psventuresassignment/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AudioCity',
          theme: AppTheme.theme,
          home: const NavigationPage(),
        ),
      ),
    );
  }
}
