import 'package:flutter/material.dart';
import 'package:instagram_ui_remake/model/post.dart';
import 'package:instagram_ui_remake/model/story.dart';
import 'package:instagram_ui_remake/model/user.dart';
import 'package:instagram_ui_remake/ui/dashboard.dart';
import 'package:instagram_ui_remake/ui/story.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
                Text(
                  user1.Username,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined,
                          color: Colors.black, size: 25),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 70,
                        width: 76,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(user1.fotoProfil))),
                      ),
                      Column(
                        children: [
                          Text(
                            user1.posts.length.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Posts",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            user1.followers.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Followers",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            user1.following.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Following",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    user1.Username,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  Text(
                    user1.bio,
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        height: 25,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Edit profil",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          style: ButtonStyle(),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 15,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: GestureDetector(
                            child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                          size: 25,
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        child: Icon(
                          Icons.add,
                          color: Colors.black87,
                          size: 30,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black87,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "New",
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.grid_on_sharp,
                  color: Colors.black,
                ),
                Icon(
                  Icons.tv_rounded,
                  color: Colors.black54,
                ),
                Icon(
                  Icons.person_pin_rounded,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              height: (user1.posts.length % 3 == 0)
                  ? (((user1.posts.length / 3) *
                      (MediaQuery.of(context).size.width / 3)))
                  : (((user1.posts.length +
                          (3 - (user1.posts.length % 3)) / 3) *
                      (MediaQuery.of(context).size.width / 3))),
              child: GridView.builder(
                  itemCount: user1.posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      user1.posts[index].post,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      fit: BoxFit.fitWidth,
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
             Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          Dashboard(),
                      transitionDuration: Duration(seconds: 0)));
            },
            icon: Icon(Icons.home_outlined, color: Colors.black, size: 30),
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
          Container(
            height: 29,
                  width: 29,
            child: Stack(
              children: [
                Container(
                  height: 29,
                  width: 29,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage(user1.fotoProfil))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
