import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              onSubmitted: (value) {
                print(value);
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search articles or tags'),
            ),
          ),
        ],
      ),
    );
  }
}
