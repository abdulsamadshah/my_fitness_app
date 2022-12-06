import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:my_fitness_app/Utils/fluttertoast.dart';

class Createplan extends StatefulWidget {
  const Createplan({Key? key}) : super(key: key);

  @override
  State<Createplan> createState() => _CreateplanState();
}

class _CreateplanState extends State<Createplan> {
  final dbref = FirebaseDatabase.instance.reference().child("userfitnessplans");
  String dropdownvalue = 'Chest';
  var category;

  var day, month, year;
  var dobs;
  TextEditingController pname = TextEditingController();
  TextEditingController pdescription = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Chest',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Plan"),
        backgroundColor: const Color(0XFF381866),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 20, top: 100),
                  child: Container(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 30),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  child: TextField(
                                    controller: pname,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Plan Name"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  child: TextField(
                                    controller: pdescription,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Description"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, top: 10),
                                child: Container(
                                  // Container(
                                  width: 300,
                                  height: 40,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          width: 160,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Select Category",
                                              labelText: "${dropdownvalue}",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(category = items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  //var dropdownvalue any object set now
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 10),
                              //   child: Container(
                              //     child: TextField(
                              //       enabled: false,
                              //       decoration: InputDecoration(
                              //           border: OutlineInputBorder(),
                              //           hintText: "Select Goal"),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: InkWell(
                                  onTap: () async {
                                    print("clicked");
                                    DateTime? datepicked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2022),
                                        lastDate: DateTime(2023));

                                    if (datepicked != null) {
                                      day = datepicked.day;
                                      month = datepicked.month;
                                      year = datepicked.year;
                                      dobs = "${day}/${month}/${year}";
                                      print("my date${day}\n$month\n $year");
                                    }
                                  },
                                  child: Container(
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Duration Weeks"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 200),
                  child: Container(
                    child: FloatingActionButton(
                      backgroundColor: Color(0XFF381866),
                      onPressed: () {
                        final date = DateTime.now().microsecondsSinceEpoch;
                        dbref.child("userplan").child(date.toString()).set({
                          'pname': pname.text.toString(),
                          'pdesc': pdescription.text.toString(),
                          'pscategory': dropdownvalue.toString(),
                          'duration': dobs.toString(),
                        }).then((value) {
                          fluttertoast()
                              .fluttertoasts("Plan Upload Successfully");
                        }).onError((error, stackTrace) {
                          fluttertoast().fluttertoasts(error.toString());
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
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
  }
}
