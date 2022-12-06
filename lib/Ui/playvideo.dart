import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

main(){
  runApp(MyAppvideo());
}

class MyAppvideo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
    controller = VideoPlayerController.network('https://www.fluttercampus.com/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Video Player in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(

      ),
    );
  }
}