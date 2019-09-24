import 'package:flutter/material.dart';
import 'package:support_articles/tab/home_tab.dart';
import 'package:support_articles/tab/search_tab.dart';
import 'package:support_articles/tab/favorite_tab.dart';
import 'package:support_articles/tab/settings_tab.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

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
  PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
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
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomeTab(),
            SearchTab(),
            FavoriteTab(),
            SettingTab()
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
            showElevation: true,
            selectedIndex: _currentIndex,
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  title: Text('Home')),
              BottomNavyBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo),
                  title: Text('Search')),
              BottomNavyBarItem(
                  icon: Icon(Icons.favorite, color: Colors.indigo),
                  title: Text('Favorite')),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings, color: Colors.indigo),
                  title: Text('Settings')),
            ],
            onItemSelected: (index) => setState(() {
                  _currentIndex = index;
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
