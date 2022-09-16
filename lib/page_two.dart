import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwoBindigs implements Bindings {
  @override
  void dependencies() {
    print('--- PageTwoBindigs.dependencies()');
    Get.put(PageTwoController());
  }
}

class PageTwoController extends GetxController {
  late String randomText;

  @override
  void onInit() {
    print('--- PageTwoController.onInit()');
    randomText = generateRandomString(10);
    super.onInit();
  }

  String generateRandomString(int len) {
    print('--- PageTwoController.generateRandomString()');
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
}

class PageTwoView extends GetView<PageTwoController> {
  const PageTwoView({Key? key}) : super(key: key);

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
                Get.toNamed('/two/4567', parameters: {'wasd': '4567'});
              },
              child: Text('Open PageTwo again'))
        ],
      ),
    );
  }
}
