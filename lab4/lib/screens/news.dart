import 'package:flutter/material.dart';
import 'package:hello_flutter/lab4/darkTheme.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin{

  AnimationController _controller;
Animation _myAnimation;

void initState() {
  super.initState();
  _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 3000),

  );
  _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        backgroundColor: Colors.redAccent[400],
      ),
      body: Center(
        child:
        FadeTransition(
          opacity: _myAnimation,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage('https://vesti.ua/wp-content/uploads/2020/06/samye-vysokie-gory-800x530.jpg')
                )
            ),
          ),
        )
    ),
      
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      FloatingActionButton(
        onPressed: () { 
          Provider.of<ThemeProvider>(context, listen: false).swapTheme();
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
        
        
        backgroundColor: Colors.redAccent[400]),
    );
  }
}
