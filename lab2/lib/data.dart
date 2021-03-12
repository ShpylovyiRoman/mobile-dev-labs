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

class Post {
  AssetImage image;
  User user;
  String description;
  List<String> likes;
  List<String> comments;
  DateTime date;
  bool isLiked;
  bool isSaved;

  Post(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}

TextStyle textStyle = new TextStyle(fontFamily: 'RobotoMono');
TextStyle textStyleBold = new TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey = new TextStyle(fontFamily: 'RobotoMono', color: Colors.grey);

final User user = new User('Ramen', AssetImage('lib/assets/6.jpg'), [], [], [], [], false);
User boris = new User('Boris', AssetImage('lib/assets/7.jpg'), [user], [user], [], [], false);
User myan = new User('Myanmar', AssetImage('lib/assets/4.jpg'), [user,boris], [user,boris], [], [], false);

Post startPost = new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, 'this is my dog', DateTime.now(), ['Kate', 'Boris'], [], false, false);

List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/1.jpg'), user, "My first post", DateTime.now(), ['Hello', 'The first'], ['Hi dear', 'How are you?'], false, false),
  new Post(new AssetImage('lib/assets/2.jpg'), boris, "My second post", DateTime.now(), ['1','2','3','4'], ['1','2','3','4'], false, false),
  new Post(new AssetImage('lib/assets/3.jpg'), myan, "My third post", DateTime.now(), [], [], null, true),
  new Post(new AssetImage('lib/assets/4.jpg'), boris, "My new post", DateTime.now(), [], [], null, true),
  new Post(new AssetImage('lib/assets/5.jpg'), user, "My last post", DateTime.now(), [], [], null, true),
];

class StoryData{
  String userName;
  String imageURL;

  StoryData(this.userName, this.imageURL);
}


Widget storyButton(StoryData story, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap:(){},

          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: Colors.red, width: 2.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: NetworkImage(story.imageURL),
                    fit: BoxFit.cover,
                  )
                  ),
                ),
              ),
          ),
        ),
        SizedBox(height: 6.0),
        Text(story.userName),
      ],
      ),
  );
}

List<StoryData> stories = [ new StoryData('Ramen', 'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340'),
  new StoryData('Boris', 'https://d.newsweek.com/en/full/520858/supermoon-moon-smartphone-photo-picture.jpg'),
  new StoryData('Aka', 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg'),
  new StoryData('Myanmar', 'https://blog.photofeeler.com/wp-content/uploads/2017/09/tinder-photo-size-tinder-picture-size-tinder-aspect-ratio-image-dimensions-crop.jpg'),
  new StoryData('Chel', 'https://static01.nyt.com/images/2018/10/04/magazine/04blackhole1/04blackhole1-articleLarge-v3.jpg?quality=75&auto=webp&disable=upscale'),
  new StoryData('Man', 'https://i.pinimg.com/736x/50/df/34/50df34b9e93f30269853b96b09c37e3b.jpg'),
  new StoryData('Cool', 'https://www.planetware.com/wpimages/2020/01/india-in-pictures-beautiful-places-to-photograph-taj-mahal.jpg'),
 ];