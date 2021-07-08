import 'package:instagram_ui_remake/model/post.dart';

class User {
  String Username, fotoProfil, followers, bio;

  int following;

  List<Post> posts;

  User(
      {required this.Username,
      required this.followers,
      required this.following,
      required this.fotoProfil,
      required this.bio,
      required this.posts});
}

User user1 = new User(
    Username: "beeerlian",
    followers: "100K",
    following: 1,
    fotoProfil: "assets/images/user1.jpg",
    bio: "informatics engineering'19\nuinsgdbandung",
    posts: posts);
