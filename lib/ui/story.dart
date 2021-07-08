import 'package:flutter/material.dart';
import 'package:instagram_ui_remake/model/post.dart';
import 'package:instagram_ui_remake/model/story.dart';
import 'package:instagram_ui_remake/ui/dashboard.dart';

class StoryView extends StatefulWidget {
  final int storyindex;

  StoryView(this.storyindex);
  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    Future<void> delay(context) async {
      await Future.delayed(Duration(seconds: 10));
      stories[widget.storyindex].isVisited = true;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Dashboard();
      }));
      return Future.delayed(Duration(seconds: 5));
    }

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: FutureBuilder(
            builder: (context, x) {
              return Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: Image.asset(stories[widget.storyindex].story));
            },
            future: (delay(context)),
          ),
        ),
        Container(
          color: Colors.black12,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 30,
                          width: 36,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      stories[widget.storyindex].cover))),
                        ),
                        Text(
                          stories[widget.storyindex].username,
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.black87,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.blue,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            hintText: "Kirim pesan",
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
