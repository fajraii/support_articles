import 'package:flutter/material.dart';
import 'package:support_articles/tab/home_tab.dart';
import 'package:support_articles/tab/search_tab.dart';
import 'package:support_articles/tab/favorite_tab.dart';
import 'package:support_articles/tab/settings_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Support Articles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato', primaryColor: Colors.indigo),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Support Articles',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TabBarView(children: <Widget>[
        HomeTab(),
        SearchTab(),
        FavoriteTab(),
        SettingTab()
      ], controller: _tabController),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.indigo,
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
            _tabController.animateTo(currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.indigo,
              ),
              title: Text(
                'Home',
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo),
              title: Text(
                'Search',
                style: TextStyle(color: Colors.indigo),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.indigo),
              title: Text('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.indigo),
              title: Text('Settings'))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
