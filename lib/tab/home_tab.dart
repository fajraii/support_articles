import 'package:flutter/material.dart';
import 'package:support_articles/models/article_data.dart';
import 'package:support_articles/widgets/card_builder.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List articles;

  @override
  void initState() {
    articles = ArticleData().articles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: RefreshIndicator(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return Cards(article: articles[index]);
            },
          ),
          onRefresh: _refreshList,
        ),
      ),
    );
  }

  Future<Null> _refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    return null;
  }
}
