import 'package:get/get.dart';

class GloablController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
