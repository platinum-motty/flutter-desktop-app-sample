import 'package:flutter/material.dart';

import '../article_util.dart';
import '../model/article.dart';

class ZennListPage extends StatefulWidget {
  const ZennListPage({super.key});

  @override
  State<ZennListPage> createState() => _ZennListPageState();
}

class _ZennListPageState extends State<ZennListPage> {
  final _feedUri = 'https://zenn.dev/feed';
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    fetchFeed(_feedUri).then((articles) => setState(() {
          _articles = articles;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final article = _articles[index];
          return ListTile(
            title: Text(article.title),
            trailing: IconButton(
              icon: const Icon(Icons.star),
              color: article.isFavorite ? Colors.yellow : Colors.grey,
              onPressed: () {
                article.toggleFavorite();
                setState(() {});
              },
            ),
            onTap: () => {launchUrl(_articles[index].link)},
          );
        },
        itemCount: _articles.length,
      ),
    );
  }
}
