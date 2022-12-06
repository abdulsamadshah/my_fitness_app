import 'package:flutter/material.dart';
import 'package:my_fitness_app/Ui/BottomNavigation/Plans.dart';
import 'package:my_fitness_app/Utils/fluttertoast.dart';

import '../services/fnotification.dart';
import 'BottomNavigation/Home.dart';
import 'BottomNavigation/More.dart';
import 'BottomNavigation/Notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../../services/local_notification_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  final dbref = FirebaseDatabase.instance.reference().child("Notification");
  final pages = [
    const Home(),
    Plans(),
     Notifications(),
    const More(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
          int datetime = DateTime.now().microsecondsSinceEpoch;

          dbref.child("usernotification").child(datetime.toString()).set({
            'titles': message.notification!.title,
            'bodys': message.notification!.body,
          }).then((value) {
            // fluttertoast().fluttertoasts("Notification uploaded successfully");
            print("notification upload");
          }).onError((error, stackTrace) {
            fluttertoast().fluttertoasts(error.toString());
          });
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
          int datetime = DateTime.now().microsecondsSinceEpoch;

          dbref.child("usernotification").child(datetime.toString()).set({
            'titles': message.notification!.title,
            'bodys': message.notification!.body,
          }).then((value) {
            print("notification upload");
            // fluttertoast().fluttertoasts("Notification uploaded successfully");
          }).onError((error, stackTrace) {
            fluttertoast().fluttertoasts(error.toString());
          });
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
          int datetime = DateTime.now().microsecondsSinceEpoch;

          dbref.child("usernotification").child(datetime.toString()).set({
            'titles': message.notification!.title,
            'bodys': message.notification!.body,
          }).then((value) {
            print("notification upload");
            // fluttertoast().fluttertoasts("Notification uploaded successfully");
          }).onError((error, stackTrace) {
            fluttertoast().fluttertoasts(error.toString());
          });
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF381866),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: Icon(
              Icons.home_outlined,
              size: 28,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: Icon(
              Icons.fitness_center,
              size: 28,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: Icon(
              Icons.notifications_sharp,
              size: 28,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: Icon(
              Icons.more_horiz,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
