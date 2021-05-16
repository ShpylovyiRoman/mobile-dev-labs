import 'package:flutter/material.dart';
import 'statistic.dart';

class LoginPage extends StatelessWidget {
  final String login;
  const LoginPage({Key key, this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
            onSubmitted: (text) {Navigator.pop(context, text);},
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.login),
            hintText: "Enter your password",
            helperText: "Use your password to log in",
        )),
        ),
    );
  }
}

class NameChecker extends StatelessWidget {
  final String name;
  const NameChecker({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hello, $name! Please enter your password:',
              style: TextStyle(fontSize: 25),
            ),
            
            MaterialButton(
              child: Text('Enter password'),
              color: Colors.redAccent[400],
              onPressed: () async {
                var passEnterRes = await Navigator.of(context).pushNamed('/login');
                if (passEnterRes == '12345') {
                  showDialog(context: context, 
                  builder: (context) => AlertDialog(title: Text('Correct password'),));
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        StatisticPage(),
                  ),
                );
                  }
                else {
                  showDialog(context: context, 
                  builder: (context) => AlertDialog(title: Text('Incorrect password! Please try again.'),));
                }
                },
            )],
        )),
    );
  }
}