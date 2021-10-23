import 'package:flutter/material.dart';
import 'package:flutter_read_project/pages/404.dart';
import 'package:flutter_read_project/pages/search.dart';
import 'package:flutter_read_project/state/book.dart';
import 'package:flutter_read_project/state/global.dart';
import 'package:flutter_read_project/state/search.dart';
import 'package:get/get.dart';

// pages
import './pages/home.dart';
import './pages/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // init state
    final GloablController gloablC = Get.put(GloablController());
    final SearchController searchC = Get.put(SearchController());
    final BookController bookC = Get.put(BookController());
// #####
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      unknownRoute: createRoute('/404', const UnknownPage()),
      getPages: [
        createRoute("/", const HomeScreen()),
        createRoute("/second", const SettingScreen()),
        createRoute("/search", const Search())
      ],
    );
  }
}

createRoute(name, page) {
  return GetPage(name: name, page: () => page);
}
