import 'package:flutter/material.dart';
import 'package:flutter_read_project/state/global.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GloablController gc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            gc.increment();
  Get.back();
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}