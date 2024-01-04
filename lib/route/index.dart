import 'package:flutter_bilibili/pages/book.dart';
import 'package:flutter_bilibili/pages/detail/detail.dart';
import 'package:flutter_bilibili/pages/home/home.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class Routes {
  static const home = '/';
  static const detail = '/detail';
  static const unknownScreen = '/404';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: '${Routes.detail}/:id',
      page: () => const DetailPage(),
    ),
    GetPage(name: Routes.unknownScreen, page: () => const UnknownScreen()),
  ];
}
