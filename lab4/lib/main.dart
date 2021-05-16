import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home.dart';
import 'screens/news.dart';
import 'screens/search.dart';
import 'screens/profile.dart';
import 'screens/add_post.dart';
import 'lab4/darkTheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Instagram',
          theme: value.getTheme(),
          home: MyHomePage(),
        );
      },
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
