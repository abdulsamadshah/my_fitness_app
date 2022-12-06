import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../../services/local_notification_service.dart';
import '../categoryabouts.dart';

class Chest extends StatelessWidget {
  Chest({Key? key}) : super(key: key);

  void initState() {
    // TODO: implement initState
   initState();
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
          print("fourgound:running");

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
          print("backgound:running");
        }
      },
    );

  }

  final dbRef = FirebaseDatabase.instance.reference().child("gymCategory");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  query: dbRef.ref.child("Chest"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    // Map<String, dynamic> datas = jsonDecode(jsonEncode(snapshot.value))  as Map<String, dynamic>;
                    Map student = snapshot.value as Map;
                    student['key'] = snapshot.key;

                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Gymabouts(
                                    student['gymvideo'],
                                    student['gymimage'],
                                    student['gymtitle'],
                                    student['gymdescription'],
                                    student['gymseconddescription'],
                                    student['gymsubdescription'],
                                  ),
                                ));
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .25,
                                        placeholder:
                                            "assets/images/appicon.png",
                                        image: student['gymimage']),
                                  ),
                                ),
                                Container(
                                  //desing containr
                                  // decoration: BoxDecoration(
                                  //   // color: Color(0XFF1A1A1C),
                                  //   // borderRadius: BorderRadius.circular(2.0),
                                  //   borderRadius: BorderRadius.only(
                                  //       topRight: Radius.circular(5.0),
                                  //       bottomRight: Radius.circular(5.0)),
                                  //
                                  //   //use two colors then use this
                                  //   // gradient: LinearGradient(
                                  //   //     colors: [
                                  //   //       Colors.indigo,
                                  //   //       Colors.blueAccent
                                  //   //     ]
                                  //   // ),
                                  // ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      student['gymtitle'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppinsmedium"),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Visibility(
                                      visible: false,
                                      child: Text(
                                        student['gymdescription'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Visibility(
                                      visible: false,
                                      child: Text(
                                        student['gymseconddescription'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Visibility(
                                      visible: false,
                                      child: Text(
                                        student['gymsubdescription'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    ]));
  }
}
