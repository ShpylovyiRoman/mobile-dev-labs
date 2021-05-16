import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _slideAnimation = Tween(begin: 200.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOutBack),
      ),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });
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
      body:Container(
        child: ListView(
        children: [
          AnimatedBuilder(animation: _slideAnimation,
            builder: (ctx, ch) =>  Container(
            width: 250,
            height: 250,
            margin: EdgeInsets.only(
                top: _slideAnimation.value,
            ),
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage('https://vesti.ua/wp-content/uploads/2020/06/samye-vysokie-gory-800x530.jpg')
                )
            ),
          )
      ),
    ]),
    ),
      
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton:
      FloatingActionButton(
        onPressed: () { 
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.redAccent[400]),
    );
  }
}

