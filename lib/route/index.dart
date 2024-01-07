import 'package:flutter_bilibili/pages/book.dart';
import 'package:flutter_bilibili/pages/detail/detail.dart';
import 'package:flutter_bilibili/pages/home/home.dart';
import 'package:flutter_bilibili/pages/login/binding.dart';
import 'package:flutter_bilibili/pages/login/index.dart';
import 'package:flutter_bilibili/pages/registration/binding.dart';
import 'package:flutter_bilibili/pages/registration/page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class Routes {
  static const home = '/';
  static const detail = '/detail';
  static const login = '/login';
  static const registration = '/registration';
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
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.registration,
      page: () => const RegistrationPage(),
      binding: RegistrationBinding(),
    ),
    GetPage(name: Routes.unknownScreen, page: () => const UnknownScreen()),
  ];
}
