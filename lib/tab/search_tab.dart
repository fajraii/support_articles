import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  size: 100.0,
                  color: Colors.white,
                ),
                Text(
                  "Search Tab",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }
}