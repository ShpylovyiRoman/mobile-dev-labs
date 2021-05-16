import 'package:flutter/material.dart';
import 'package:hello_flutter/lab4/addPost.dart';
import 'package:hello_flutter/lab4/insult.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNew createState() => _AddNew();
}

class _AddNew extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.redAccent[400],
      ),
      body: Container(
        child: NewPostPage()
      ),
    );
  }
}

class NewPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Please login to continue',
              style: TextStyle(fontSize: 25),
            ),
            MaterialButton(
              child: Text('Login'),
              color: Colors.redAccent[400],
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        PostAdder(),
                  ),
                );
              },
            ),
            MaterialButton(
              child: Text('Get free insult'),
              color: Colors.redAccent[400],
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        InsultPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}