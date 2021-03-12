import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/news.dart';
import 'screens/search.dart';
import 'screens/profile.dart';
import 'screens/add_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screens = [
    HomePage(),
    Search(),
    AddNew(),
    News(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: screens,
        ),
        bottomNavigationBar: Container(
          child: new TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.search_sharp)),
              Tab(icon: Icon(Icons.add_box_outlined)),
              Tab(icon: Icon(Icons.favorite_border_outlined)),
              Tab(icon: Icon(Icons.account_circle_outlined)),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.redAccent[400],
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}