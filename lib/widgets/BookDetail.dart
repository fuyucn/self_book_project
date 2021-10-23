import 'package:flutter/material.dart';
import 'package:flutter_read_project/model/Book.dart';

class BookDetail extends StatelessWidget {
  Book book;
  BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 120,
          ),
          Container(
            child: Column(
              children: [
                Text(book.title),
                Text(book.author),
                Text(book.lastUpdated)
              ],
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
