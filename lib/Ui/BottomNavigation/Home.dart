import 'package:flutter/material.dart';

import '../fitnesscategorydata.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);



  static var gymcategory=[
    Image.asset("assets/images/chestmain.png"),
    Image.asset("assets/images/bacmain.png"),
    Image.asset("assets/images/biceps.png"),
    Image.asset("assets/images/buttocksman.png"),
    Image.asset("assets/images/calfmain.png"),
    Image.asset("assets/images/cardiomain.png"),
    Image.asset("assets/images/forearmsmain.png"),
    Image.asset("assets/images/shouldermain.png"),
    Image.asset("assets/images/trapesmain.png"),
    Image.asset("assets/images/tricepsmain.png"),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          InkWell(
            onTap: (){
              print("clicked");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 40,
                width: 40,
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                      "assets/images/appicon.png"),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(

                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/homeheader.png",
                              fit: BoxFit.fill,
                              width: 400,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 190),
                            child: Container(
                              child: SizedBox(
                                child: Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 27, fontFamily: "Poppinssemibold"),
                                ),
                              ),
                            ),
                          ),
                          //all horizontal
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 10),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/yoga.png",
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text(
                                            "Yoga",
                                            style: TextStyle(
                                                fontFamily: "Poppinsmedium",
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 10),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/strength.png",
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Text(
                                                    "Strength",
                                                    style: TextStyle(
                                                        fontFamily: "Poppinsmedium",
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 10),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/streching.png",
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Text(
                                                    "Streching",
                                                    style: TextStyle(
                                                        fontFamily: "Poppinsmedium",
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 10),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/homeexercise.png",
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Text(
                                                    "Home excercise",
                                                    style: TextStyle(
                                                        fontFamily: "Poppinsmedium",
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),





                        ],
                      ),

                    ),
                  ),



                ),
              ),
            //paste now
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 20),
                child: Container(
                  height: 250,
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => gymCategory(),));
                     },
                     child: GridView.count(crossAxisCount: 2,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10,
                       //Vertical viewport was given unbounded height. this error then you can use    scrollDirection: Axis.vertical,
                       //                 shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       children: [
                         Container(child: gymcategory[0],),
                         Container(child: gymcategory[1],),
                         Container(child: gymcategory[2],),
                         Container(child: gymcategory[3],),
                         Container(child: gymcategory[4],),
                         Container(child: gymcategory[5],),
                         Container(child: gymcategory[6],),
                         Container(child: gymcategory[7],),
                         Container(child: gymcategory[8],),
                         Container(child: gymcategory[9],),
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
