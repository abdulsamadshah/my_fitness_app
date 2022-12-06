import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../../services/local_notification_service.dart';
import '../categoryabouts.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  final dbref = FirebaseDatabase.instance.reference().child("Notification");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          backgroundColor: const Color(0XFF381866),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FirebaseAnimatedList(
                      query: dbref.ref.child("usernotification"),
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
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Gymabouts(
                                //         student['gymvideo'],
                                //         student['gymimage'],
                                //         student['gymtitle'],
                                //         student['gymdescription'],
                                //         student['gymseconddescription'],
                                //         student['gymsubdescription'],
                                //       ),
                                //     ));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   child: ClipRRect(
                                    //     borderRadius: BorderRadius.circular(7),
                                    //     child: FadeInImage.assetNetwork(
                                    //         fit: BoxFit.cover,
                                    //         width: MediaQuery.of(context)
                                    //                 .size
                                    //                 .width *
                                    //             1,
                                    //         height: MediaQuery.of(context)
                                    //                 .size
                                    //                 .height *
                                    //             .25,
                                    //         placeholder:
                                    //             "assets/images/appicon.png",
                                    //         image: student['gymimage']),
                                    //   ),
                                    // ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: Text(
                                          student['titles'],
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
                                          visible: true,
                                          child: Text(
                                            student['bodys'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
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
