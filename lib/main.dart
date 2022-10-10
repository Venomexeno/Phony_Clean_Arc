import 'package:clean_arc_phony/Latest_devices/presentation/screens/latest_screen.dart';
import 'package:clean_arc_phony/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movies App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LatestDevicesScreen(),
        );
      },
    );
  }
}
