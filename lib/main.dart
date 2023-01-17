import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/utils/routes.dart';
import 'package:shop_app/utils/strings.dart';
import 'package:shop_app/utils/theme.dart';

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  await initServices();
  initController();
  runApp(MyApp());
}

Future initServices() async {
  await Get.putAsync<ProductService>(() => ProductService().init());
}

void initController() {
  Get.lazyPut(() => CartController());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$appNameString Demo',
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
