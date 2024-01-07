import 'package:flutter/material.dart';
import 'package:flutter_bilibili/http/core/hi_error.dart';
import 'package:flutter_bilibili/http/dao/login_dao.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordFocus = false.obs;

  login() async {
    try {
      var result = await LoginDao.login(
        userName: usernameController.text,
        password: passwordController.text,
      );
      print(result);
      Get.snackbar(result['msg'], '');
    } on HiNetError catch (e) {
      print('=======$e');
      Get.bottomSheet(
        const Text('登录失败'),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      );
    }
  }
}
