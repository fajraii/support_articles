import 'package:flutter/material.dart';
import 'package:support_articles/models/article_data.dart';
import 'package:support_articles/widgets/card_builder.dart';

class FavoriteTab extends StatefulWidget {
  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  List articles;

  @override
  void initState() {
    articles = ArticleData().getFavorites;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: RefreshIndicator(
        onRefresh: _refreshList,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            return Cards(article: articles[index]);
          },
        ),
      ),
    ));
  }
}

Future<Null> _refreshList() async {
  await Future.delayed(Duration(seconds: 2));
  return null;
}
