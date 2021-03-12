import 'post.dart';
import 'package:flutter/material.dart';

class User {
  String username;
  AssetImage profilePicture;
  List<Post> posts;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;
  bool hasStory;

  User(this.username, this.profilePicture, this.followers, this.following, this.posts, this.savedPosts, this.hasStory);
}