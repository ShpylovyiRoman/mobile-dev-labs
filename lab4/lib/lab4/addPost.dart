import 'package:flutter/material.dart';
import 'package:hello_flutter/lab4/router.dart';


class PostAdder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add post',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Please enter your name:',
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              onSubmitted: (text) {var name = text.toString();
                Navigator.of(context).pushNamed('/name', arguments: name);},
              decoration: InputDecoration(
              icon: Icon((Icons.account_circle_outlined)),
            )),],
        ),
      ),
    );
  }
}