import 'package:flutter/material.dart';
import 'package:hello_flutter/models/post.dart';
import 'package:hello_flutter/models/data.dart';
import 'package:hello_flutter/models/user.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int page = 1;
  static Post mainPost = startPost;
  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview = {
      1 : getMain()
    };
    return pageview[page];
  }

  Widget getMain() {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child:AppBar(
        title: Text('Instagram', style: TextStyle(color: Colors.black, fontFamily: 'RobotoMono')),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.redAccent[400]),
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.send),
        backgroundColor: Colors.redAccent[400]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Container(width: double.infinity,
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    storyButton(stories[0], context),
                    storyButton(stories[1], context),
                    storyButton(stories[2], context),
                    storyButton(stories[3], context),
                    storyButton(stories[4], context),
                    storyButton(stories[5], context),
                    storyButton(stories[6], context)
                  ],
                )
                ),
                Divider(),
                Column(
                  children: getPosts(context),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index ++;
    }
    return posts;
  }

  Widget getPost(BuildContext context, Post post, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(backgroundImage: post.user.profilePicture,),
                    ),
                    Text(post.user.username,)
                    
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 1),
            color: Colors.grey,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 282
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
                ),
              boxShadow: [
                 BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                  ),
                ],
              image: DecorationImage(
                image: post.image
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.favorite_border_outlined, size: 30, color: Colors.red),
                      IconButton(icon: Icon(Icons.favorite), color:  Colors.red,
                      onPressed: () {},)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.add_comment_rounded , size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.add_comment_rounded ), color: Colors.black,
                      onPressed: () {
                        
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.send, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.send), color: Colors.black,
                      onPressed: () {
                      },)
                    ],
                  )
                ],
              ),
              Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.bookmark, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.bookmark), color: post.isSaved ? Colors.black : Colors.white,
                      onPressed: () {
                        setState(() {
                            userPosts[index].isSaved = post.isSaved ? false : true; 
                            if (!post.isSaved) {
                              user.savedPosts.remove(post);
                            } else {
                              user.savedPosts.add(post);
                            }                       
                          });
                      },)
                    ],
                  )
            ],
          ),
          FlatButton(
            child: Text(post.likes.length.toString() + " likes", style: textStyleBold,),
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  post.user.username,
                  style: textStyleBold,
                ),
              ),
              Text(
                post.description,
                style: textStyle,
              )
            ],
          ),
          FlatButton(
            child: Text("View all " + post.comments.length.toString() + " comments", style: textStyleLigthGrey,),
            onPressed: () { },
          ),
        ],
      )
    );
  }
}



Widget getStories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getUserStories()
    );
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (User follower in user.following) {
      stories.add(getStory(follower));
    }
    return stories;
  }

  Widget getStory(User follower) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor: follower.hasStory ? Colors.red : Colors.grey,
                  ),
                ),
                Container(
                  height: 47,
                  width: 47,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundImage: follower.profilePicture,
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {

                  },
                )
              ],
            )
          ),
          Text(follower.username, style: textStyle)
        ],
      ),
    );
  }