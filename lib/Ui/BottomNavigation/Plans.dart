import 'package:flutter/material.dart';
import 'package:my_fitness_app/Ui/createplan.dart';

class Plans extends StatelessWidget {
   Plans({Key? key}) : super(key: key);

  var colorarray = [
    Colors.black,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
    Colors.amber,
    Colors.black,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
    Colors.amber,
    Colors.black,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
    Colors.amber,
    Colors.black,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
    Colors.amber,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Plan"),
        backgroundColor: const Color(0XFF381866),
      ),
      body: Center(
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Createplan(),));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 60, bottom: 5),
                            child: SizedBox(
                              child: Text(
                                "My Plans",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Poppinssemibold"),
                              ),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 150,
                            child: Card(
                              child: Column(
                                children: [
                                  Container(

                                    child: Icon(Icons.add, size: 50,),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                          "Create New Plan \nNo Plan added top to Create a new plan"),
                                    ),
                                  )
                                ],
                              ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Container(
                    height: 440,

                        child: GridView.count(crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: [

                            // Container(color: colorarray[0],),
                            // Container(color: colorarray[1],),
                            // Container(color: colorarray[2],),
                            // Container(color: colorarray[3],),
                            // Container(color: colorarray[4],),
                            // Container(color: colorarray[5],),
                            // Container(color: colorarray[6],),
                          ],

                        ),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
