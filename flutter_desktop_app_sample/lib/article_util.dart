import 'dart:io';

import 'package:http/io_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

import './model/article.dart';

Future<List<Article>> fetchFeed(String url) async {
  final client = IOClient(HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true));
  final response = await client.get(Uri.parse(url));
  final feed = RssFeed.parse(response.body);

  List<Article> articles = [];
  for (var item in feed.items!) {
    articles.add(Article(article: item));
  }

  client.close();

  return articles;
}

Future<void> launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    return;
  }
  await launchUrl(url);
}
