import 'package:flutter/material.dart';
import 'package:my_fitness_app/Ui/Categoryui/Back.dart';
import 'package:my_fitness_app/Ui/Categoryui/Biceps.dart';
import 'package:my_fitness_app/Ui/Categoryui/Buttocks.dart';
import 'package:my_fitness_app/Ui/Categoryui/Calf.dart';
import 'package:my_fitness_app/Ui/Categoryui/Cardio.dart';
import 'package:my_fitness_app/Ui/Categoryui/Forearm.dart';
import 'package:my_fitness_app/Ui/Categoryui/Shoulder.dart';
import 'package:my_fitness_app/Ui/Categoryui/Trapes.dart';
import 'package:my_fitness_app/Ui/Categoryui/Triceps.dart';
import 'package:my_fitness_app/Ui/Categoryui/chest.dart';

import 'BottomNavigation/Home.dart';
import 'BottomNavigation/More.dart';
import 'BottomNavigation/Notifications.dart';
import 'BottomNavigation/Plans.dart';

class gymCategory extends StatefulWidget {
  const gymCategory({Key? key}) : super(key: key);

  @override
  State<gymCategory> createState() => _gymCategoryState();
}

class _gymCategoryState extends State<gymCategory> {
//how to mulple pages handle in one screen
  List<String> gymcategorylist = [
    "Chest",
    "Back",
    "Biceps",
    "Buttocks",
    "Calf",
    "Cardio",
    "Forearm",
    "Shoulder",
    "Trapes",
    "Triceps",
  ];

  // int page = 0;
  final pages = [
    Chest(),
    Back(),
    Biceps(),
    Buttocks(),
    Calf(),
    Cardio(),
    Forarm(),
    Shoulder(),
    Trapes(),
    Triceps(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gym Category"),
        backgroundColor: const Color(0XFF381866),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: OutlinedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(gymcategorylist[index]),
                                ),
                              ),
                            ))
                      ],
                    );
                  },
                  itemCount: gymcategorylist.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                height: 550,
                child: pages[current],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
