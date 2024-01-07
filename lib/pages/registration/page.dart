import 'package:flutter/material.dart';
import 'package:flutter_bilibili/pages/registration/controller.dart';
import 'package:flutter_bilibili/widgets/text_input.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetView<RegistrationController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('注册'),
        ),
      ),
      body: Container(
        child: ListView(
          //自适应键盘弹起，防止遮挡
          children: [
            TextInput(
              title: '用户名',
              hint: "请输入用户名",
              controller: controller.userNameController,
              onChanged: (val) {
                print(controller.userNameController.text);
              },
            ),
            TextInput(
              title: '密码',
              hint: "请输入密码",
              lineStretch: false,
              controller: controller.passwordController,
              obscureText: true,
              onChanged: (val) {
                print(controller.passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
