import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
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
                  "Favorite Tab",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }
}