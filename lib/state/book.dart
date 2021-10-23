import 'package:flutter_read_project/model/Book.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  RxMap books = {}.obs;

  updateBook(Book book) {
    print('book ${book.id}');
    books[book.id] = book;
  }
}
