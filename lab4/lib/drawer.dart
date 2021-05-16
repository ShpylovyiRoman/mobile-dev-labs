import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawer createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent[400], ),
            accountName: Text('Roman Shpylovyi'),
            accountEmail: Text('meisonon@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/1.jpg'),
            ),
            ),
          ListTile(title: Text('Age: 19')),
          Divider(),
           ListTile(title: Text('Course: 3')),
          Divider(),
           ListTile(title: Text('Group IP-83')),
          Divider(),
        ],
      ),
    );
  }
}