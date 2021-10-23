class Book {
  String id;
  String title;
  String author;
  String lastUpdated;
  String url;
  List<Chapter> chapters;
  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.lastUpdated,
      required this.url,
      required this.chapters});

  log() {
    print('Book, ${id} $title $author $lastUpdated $url ${chapters.length}');
  }
}

class Chapter {
  int id;
  String name;
  String url;

  Chapter({required this.id, required this.name, required this.url});

  log() {
    print('Chapter, ${id} $name $url');
  }
}
