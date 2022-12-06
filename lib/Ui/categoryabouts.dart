import 'package:my_fitness_app/Ui/Dashboard.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class gymabouts extends StatelessWidget {
  const gymabouts({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Gymabouts extends StatefulWidget {
  // final Data task;
  var gymvideo,
      gymimg,
      gymtitle,
      gymdescription,
      gymsecondesc,
      gymsubdescription;

  Gymabouts(this.gymvideo, this.gymimg, this.gymtitle, this.gymdescription,
      this.gymsecondesc, this.gymsubdescription);

  @override
  State<Gymabouts> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Gymabouts> {
  late VideoPlayerController controller;
  final dbRef = FirebaseDatabase.instance.reference().child("gymCategory");

  @override
  void initState() {
    // TODO: implement initState
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.network(widget.gymvideo);
    controller.addListener(() {
      setState(() {
        controller.play();
      });
    });
    controller.initialize().then((value) {
      setState(() {
        controller.pause();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.pause();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.gymtitle}"),
          backgroundColor: Colors.deepPurple,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                },
                child: Icon(Icons.home_outlined)),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: InkWell(
                    onTap: () {
                      print("clicked");
                      controller.pause();
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          //use this crossalignment the you can start
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: 360,
                              child: AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 5, top: 5),
                              child: SizedBox(
                                child: Text(
                                  widget.gymtitle,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppinsmedium"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 5, top: 3),
                              child: SizedBox(
                                child: Text(
                                  "Level Beginner:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppinsmedium"),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Divider(
                                height: 1,
                                color: Colors.black87,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, right: 5),
                              child: SizedBox(
                                child: Text(
                                  widget.gymdescription,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppinsmedium"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 5, top: 10),
                              child: SizedBox(
                                child: Text(
                                  widget.gymsecondesc,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppinsmedium"),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Divider(
                                height: 1,
                                color: Colors.black87,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 5),
                              child: SizedBox(
                                child: Text(
                                  widget.gymsubdescription,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppinsmedium"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 5, top: 10),
                              child: SizedBox(
                                child: Text(
                                  "More Related Excercise:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppinsmedium",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Divider(
                                height: 1,
                                color: Colors.black87,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
