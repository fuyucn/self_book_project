import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class Html {
  static Document htmlParse(htmlStr) {
    return parse(htmlStr);
  }
}
