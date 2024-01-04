import 'package:flutter/material.dart';
import 'package:flutter_bilibili/pages/detail/detail.dart';
import 'package:flutter_bilibili/pages/home/home.dart';
import 'package:flutter_bilibili/route/index.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.home,
    getPages: AppPages.pages,
    // home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bilibili',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
