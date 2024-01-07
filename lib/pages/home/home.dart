import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/http/core/hi_net.dart';
import 'package:flutter_bilibili/http/dao/login_dao.dart';
import 'package:flutter_bilibili/http/request/notice_request.dart';
import 'package:flutter_bilibili/route/index.dart';
import 'package:get/get.dart';

import '../../model/demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DemoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        children: [
          const Text('HomePage'),
          CupertinoButton(
            onPressed: () {
              // Get.toNamed('/detail/11111');
              // testLogin();
              Get.toNamed(Routes.login);
              // testNotice();
            },
            child: const Text('go Detail'),
          ),
          CupertinoButton(
            onPressed: () {
              Get.toNamed(Routes.registration);
            },
            child: const Text('go registration'),
          ),
          Obx(() => Text('${controller.count}')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void testLogin() {
    var result = LoginDao.login(
      userName: 'henley',
      password: '123',
    );
    print(result);
  }

  void testRegistration() {
    var result = LoginDao.registration(
      userName: 'henley',
      password: '123',
    );
    print(result);
  }

  void testNotice() async {
    var result = await HiNet.getInstance().fire(NoticeRequest());
    print(result);
  }
}
