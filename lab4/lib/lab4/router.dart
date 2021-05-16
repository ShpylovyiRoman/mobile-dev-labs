import 'package:flutter/material.dart';
import 'addPost.dart';
import 'login.dart';

class RouteGenerator {
   static Route<dynamic> generateRoute(RouteSettings settings) {
   switch (settings.name) {
     case '/':
       return MaterialPageRoute(builder: (context) => AddPostPage());
     case '/login':
       var arg = settings.arguments;
       return MaterialPageRoute(builder: (context) => LoginPage(login: arg,));
     case '/name':
       var arg2 = settings.arguments;
       return MaterialPageRoute(builder: (context) => NameChecker(name: arg2,));
     default:
       return MaterialPageRoute(builder: (context) => AddPostPage());
    }
  }
}