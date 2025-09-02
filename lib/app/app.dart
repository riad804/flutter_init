import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/theme_service.dart';
import 'di/injection.dart';
import 'router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<ThemeService>().themeStream,
      initialData: ThemeData.light(),
      builder: (context, snap) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routerConfig: router,
              theme: snap.data,
              builder: (context, widget) {
                return MediaQuery(data: MediaQuery.of(context), child: widget!);
              },
            );
          },
        );
      },
    );
  }
}
