import 'package:webfeed/webfeed.dart';

class Article {
  late String _title;
  late String _link;
  bool _isFavorite = false;

  // constructor
  Article({required RssItem article}) {
    _title = article.title.toString();
    _link = article.link.toString();
  }

  // getter
  String get title => _title;
  String get link => _link;
  bool get isFavorite => _isFavorite;

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
  }
}
