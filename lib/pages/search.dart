import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_read_project/constants/common.dart';
import 'package:flutter_read_project/model/Book.dart';
import 'package:flutter_read_project/state/book.dart';
import 'package:flutter_read_project/state/search.dart';
import 'package:flutter_read_project/utils/Common.dart';
import 'package:flutter_read_project/utils/Html.dart';
import 'package:flutter_read_project/utils/http.dart';
import 'package:gbk_codec/gbk_codec.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

String gbkDecoder(List<int> responseBytes, RequestOptions options,
    ResponseBody responseBody) {
  return gbk_bytes.decode(responseBytes);
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _stc = TextEditingController();
  final SearchController sc = Get.find();
  final BookController bc = Get.find();
  List<dynamic> bks = [];
  int page = 1;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _stc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _stc.addListener(() {
      // ignore: avoid_print
      print('Second text field: ${_stc.text}');
    });
  }

  getSearchData() async {
    // var url = '${Common.search}?key=${sc.term}&page=$page&siteid=app2';

    // var res = await Dio().get(url);
    try {
      String bookAddress = "http://www.b520.cc/147_147321/";
      var res2 = await Http(context)
          .http()
          .get(bookAddress, options: Options(responseDecoder: gbkDecoder));

      List bookChapters = Html.htmlParse(res2.data.toString())
          .body!
          .querySelector('#list')!
          .querySelectorAll("dd")
          .toList();
      Map uniqueChapters = {};

      List<Chapter>? chapters = [];
      for (var bc in bookChapters) {
        var chapterLink = bc!.firstChild!.attributes['href'];
        var chapterTitle = bc.text;
        var id = chapterLink
            .substring(chapterLink.lastIndexOf("/") + 1)
            .replaceAll(".html", "");

        uniqueChapters[int.parse(id)] = new Chapter(
            id: int.parse(id), name: chapterTitle, url: chapterLink);
      }
      chapters = uniqueChapters.values.cast<Chapter>().toList();

      chapters.sort((a, b) => a.id - b.id);

      var bookInfo =
          Html.htmlParse(res2.data.toString()).getElementById("info");

      var bookId = bookAddress.split("/")[3];
      var bookName = "";
      var bookAuthor = "";
      var bookLastUpdated = "";
      if (bookInfo!.hasChildNodes()) {
        bookName = bookInfo.children[0].innerHtml;
        bookAuthor = bookInfo.children[1].innerHtml.replaceAll("&nbsp;", "");
        bookLastUpdated = bookInfo.children[3].innerHtml;
      }
      Book newBook = new Book(
          id: bookId,
          url: bookAddress,
          author: bookAuthor,
          chapters: chapters,
          lastUpdated: bookLastUpdated,
          title: bookName);
      bc.updateBook(newBook);

      print(bc.books.keys);
      // Utils.printLongString(res2.data);
    } catch (e) {
      print('error');
      print(e);
    }
    // List data = jsonDecode(res.data)['data'];
    // if (data.length == 0) {
    //   _refreshController.loadNoData();
    // } else {
    //   data.forEach((f) {
    //     bks.add(SearchItem.fromJson(f));
    //   });
    //   if (mounted) {
    //     setState(() {});
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Row(children: [
        Expanded(
            child: TextField(
          onChanged: (String v) {
            sc.onChange(v);
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter a search term'),
        )),
        IconButton(
            onPressed: () {
              //
              // ignore: avoid_print
              print('${sc.term}');
              getSearchData();
            },
            icon: const Icon(Icons.search))
      ]),
      Container(
        child: Obx(() => Text('${sc.term.value}====${sc.term}====')),
      ),
      // ListView(
      //   children: [],
      // )
    ])));
  }
}
