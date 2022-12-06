import 'package:flutter/material.dart';
import 'package:my_fitness_app/Ui/Setting.dart';

import '../Profile.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        backgroundColor: const Color(0XFF381866),
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          child: Icon(Icons.settings),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: Text("Setting", style: TextStyle(fontSize: 20,
                              fontFamily: "Poppinssemibold",
                              fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          child: Icon(Icons.supervised_user_circle_outlined),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: Text("Profile", style: TextStyle(fontSize: 20,
                              fontFamily: "Poppinssemibold",
                              fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}

