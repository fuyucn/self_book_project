import 'package:flutter/material.dart';
import 'package:flutter_read_project/state/book.dart';
import 'package:flutter_read_project/state/global.dart';
import 'package:flutter_read_project/widgets/BookDetail.dart';
import 'package:get/get.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final BookController bc = Get.find();

    return Scaffold(
      body: Column(children: [BookDetail(book: book)]),
    );
  }
}
