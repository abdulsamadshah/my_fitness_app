import 'package:flutter/material.dart';
import 'package:my_fitness_app/Utils/fluttertoast.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  //swithc button
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        fluttertoast().fluttertoasts("Helth tips On");
        // textValue = 'Switch Button is ON';
      });
      fluttertoast().fluttertoasts("Helth tips On");
      // print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        // textValue = 'Switch Button is OFF';
        fluttertoast().fluttertoasts("Helth tips off");
      });
      fluttertoast().fluttertoasts("Helth tips off");
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: const Color(0XFF381866),
      ),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250, top: 30),
                child: Container(
                  child: Container(
                    child: Text("General",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppinssemibold",
                            fontSize: 22)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          child: Icon(Icons.language),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Change Language",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppinsmedium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.logout),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppinsmedium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200, top: 30),
                child: Container(
                  child: Container(
                    child: Text("Notification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppinssemibold",
                            fontSize: 22)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.notifications_on_sharp),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Health Tips",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppinsmedium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Container(
                            child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.indigo,
                          // activeTrackColor: Colors.yellow,
                          // inactiveThumbColor: Colors.redAccent,
                          // inactiveTrackColor: Colors.orange,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250, top: 20),
                child: Container(
                  child: Container(
                    child: Text("About",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppinssemibold",
                            fontSize: 22)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.privacy_tip),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppinsmedium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Icon(Icons.share),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Share this App",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppinsmedium",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
