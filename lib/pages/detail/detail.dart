import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/demo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DemoController());
    String id = Get.parameters['id'] as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
      ),
      body: Column(
        children: [
          const Text('DetailPage'),
          Obx(() => Text('${controller.count}')),
          Text(id),
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
}
