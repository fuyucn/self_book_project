import 'package:get/get.dart';

class SearchController extends GetxController {
  var term = "".obs;

  onChange(v) => term = RxString(v);

  getTerm() => term;
}
