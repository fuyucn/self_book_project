import 'package:flutter/material.dart';
import 'package:flutter_read_project/state/global.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GloablController gc = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to the second screen when tapped.
              Get.toNamed('/search');
            },
            child: Text("Search Page"),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the second screen when tapped.
              Get.toNamed('/second');
            },
            child: Obx(() => Text("Launch screen ${gc.count}")),
          )
        ]),
      ),
    );
  }
}
