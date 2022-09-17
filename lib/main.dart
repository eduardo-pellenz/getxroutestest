import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getxroutestest/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => const PageOne()),
        GetPage(
            name: '/two/:id',
            preventDuplicates: false,
            page: () => const PageTwoView(),
            binding: PageTwoBindigs()),
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/two/1234', arguments: '1234');
              },
              child: Text('Open PageTwo'))
        ],
      ),
    );
  }
}
