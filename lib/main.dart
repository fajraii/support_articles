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
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Support Articles', style: TextStyle(color: Colors.indigo),),
      ),
      body: TabBarView(children: <Widget>[
        HomeTab(),
        SearchTab(),
        FavoriteTab(),
        SettingTab()
      ], controller: _tabController),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Material(
          child: TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home, color:  Colors.indigo), text: 'Home',),
              Tab(icon: Icon(Icons.search, color:  Colors.indigo), text: 'Search',),
              Tab(icon: Icon(Icons.favorite, color:  Colors.indigo), text: 'Favorites',),
              Tab(icon: Icon(Icons.settings, color:  Colors.indigo), text: 'Settings',)
            ],
            controller: _tabController,
            unselectedLabelColor: Colors.indigo,
            labelColor: Colors.indigo,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}