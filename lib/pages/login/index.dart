import 'package:flutter/material.dart';
import 'package:flutter_bilibili/pages/login/controller.dart';
import 'package:flutter_bilibili/route/index.dart';
import 'package:flutter_bilibili/widgets/full_button.dart';
import 'package:flutter_bilibili/widgets/login_effect.dart';
import 'package:flutter_bilibili/widgets/text_input.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.registration);
            },
            child: const Text(
              '注册',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => LoginEffect(
              protect: controller.isPasswordFocus.value,
            ),
          ),
          TextInput(
            title: '用户名',
            hint: "请输入用户名",
            controller: controller.usernameController,
          ),
          TextInput(
            title: '密码',
            hint: "请输入密码",
            controller: controller.passwordController,
            obscureText: true,
            focusChanged: (value) {
              print(value);
              controller.isPasswordFocus.value = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: FullButton(
              title: '登录',
              enable: true,
              onPressed: () {
                controller.login();
              },
            ),
          )
        ],
      ),
    );
  }
}
