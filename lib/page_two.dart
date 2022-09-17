import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwoBindigs implements Bindings {
  @override
  void dependencies() {
    print('--- PageTwoBindigs.dependencies()');
    Get.put(PageTwoController(), tag: Get.arguments as String);
  }
}

class PageTwoController extends GetxController {
  late String randomText;

  @override
  void onInit() {
    print('--- PageTwoController.onInit()');
    randomText = generateRandomString(24);
    super.onInit();
  }

  String generateRandomString(int len) {
    print('--- PageTwoController.generateRandomString()');
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values).replaceAll('==', '');
  }
}

class PageTwoView extends GetView<PageTwoController> {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  String? get tag => Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    print('--- PageTwoView.build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: Column(
        children: [
          Text(controller.randomText),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/two/${controller.randomText}',
                    arguments: controller.randomText);
              },
              child: Text('Open PageTwo again'))
        ],
      ),
    );
  }
}
