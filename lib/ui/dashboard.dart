import 'package:flutter/material.dart';
import 'package:instagram_ui_remake/model/post.dart';
import 'package:instagram_ui_remake/model/story.dart';
import 'package:instagram_ui_remake/ui/profil.dart';
import 'package:instagram_ui_remake/ui/story.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Image.asset(
                  "assets/logo/logo.png",
                  height: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 85,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return StoryView(index);
                                }));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 66,
                                    width: 66,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        style: BorderStyle.solid,
                                        color: stories[index].isVisited
                                            ? Colors.black54
                                            : Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                stories[index].cover))),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              stories[index].username,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  height: 2,
                  color: Colors.black45,
                ),
                Column(
                  children: List.generate(
                      posts.length, (index) => Postingan(index: index)),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_filled, color: Colors.black, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined, color: Colors.black, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline, color: Colors.black, size: 30),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          Profil(),
                      transitionDuration: Duration(seconds: 0)));
            },
            child: Container(
              margin: EdgeInsets.all(3),
              height: 28,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/user1.jpg"))),
            ),
          ),
        ],
      ),
    );
  }
}

class Postingan extends StatefulWidget {
  int index;
  Postingan({Key? key, required this.index}) : super(key: key);

  @override
  _PostinganState createState() => _PostinganState();
}

class _PostinganState extends State<Postingan> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(3),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(stories[index].cover))),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      posts[index].username,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined, color: Colors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
              onDoubleTap: () {
                posts[index].isLiked
                    ? posts[index].isLiked = false
                    : posts[index].isLiked = true;

                posts[index].isLiked
                    ? posts[index].like++
                    : posts[index].like--;
                setState(() {});
              },
              child: Image.asset(posts[index].post)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      posts[index].isLiked
                          ? posts[index].isLiked = false
                          : posts[index].isLiked = true;

                      posts[index].isLiked
                          ? posts[index].like++
                          : posts[index].like--;
                      setState(() {});
                    },
                    icon: posts[index].isLiked
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.near_me_outlined),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  posts[index].isSaved
                      ? posts[index].isSaved = false
                      : posts[index].isSaved = true;
                  setState(() {});
                },
                icon: posts[index].isSaved
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${posts[index].like.toString()} suka",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "${posts[index].username}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${posts[index].caption}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Lihat semua ${posts[index].comment.toString()} komentar",
                  style: TextStyle(color: Colors.black45, fontSize: 11),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
