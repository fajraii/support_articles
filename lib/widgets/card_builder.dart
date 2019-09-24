import 'package:flutter/material.dart';
import 'package:support_articles/models/article.dart';

class Cards extends StatelessWidget {
  final Article article;

  Cards({this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: FlutterLogo(
        size: 72.0,
      ),
      title: Text(article.title),
      subtitle: Text(article.content),
      isThreeLine: true,
    ));
  }
}
