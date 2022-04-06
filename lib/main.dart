import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/pages/main_page.dart';
import 'package:pattern_getx/pages/payment_page.dart';
import 'package:pattern_getx/pages/setting_page.dart';
import 'package:pattern_getx/services/bind_service.dart';
import 'package:pattern_getx/services/di_service.dart';

Future main()async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Pattern GetX',
      home: SettingPage(),
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(
      //       name: MainPage.id, page: () => MainPage(), binding: BindService())
      // ],
    );
  }
}
