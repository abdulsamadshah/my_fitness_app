import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'package:my_fitness_app/Utils/fluttertoast.dart';
import 'dart:io';

import '../Ui/Dashboard.dart';
import '../Utils/roundbtn.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _SignupState();
}

class _SignupState extends State<Profile> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;
  String? genders;
  var day, month, year;
  final pickimage = ImagePicker();
  File? image;

  //alert dialog
  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(DismissAction);
                    },
                    child: Container(
                      child: RadioListTile(
                        title: Text("Male"),
                        value: "Male",
                        groupValue: genders,
                        onChanged: (value) {
                          setState(() {
                            genders = value.toString();
                            print(genders);
                          });
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: RadioListTile(
                      title: Text("Female"),
                      value: "Female",
                      groupValue: genders,
                      onChanged: (value) {
                        setState(() {
                          genders = value.toString();
                          print(genders);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //Choose gallery dialog
  void selectimagedailog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImagecamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getImageGallery();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.browse_gallery),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30,top: 15),
            child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
        backgroundColor: const Color(0XFF381866),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  //iamges loading offline
                  padding: const EdgeInsets.only(left: 0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        // selectimagedailog(context);
                        print("selected");
                      },
                      child: Container(
                        // height: MediaQuery.of(context).size.height * .2,
                        // width: MediaQuery.of(context).size.height * 1,

                        child: Container(
                            height: 90,
                            width: 90,
                            // height: MediaQuery.of(context).size.height * .2,
                            // width: MediaQuery.of(context).size.height * 1,

                            child: CircleAvatar(
                                child: image != null
                                    ? ClipRect(
                                  child: Image.file(image!.absolute,
                                      fit: BoxFit.fitHeight),
                                )
                                    : Container(
                                  child: CircleAvatar(
                                    foregroundImage: AssetImage(
                                        "assets/images/appicon.png"),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/userimg.png"),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "First name",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 35,
                            child: TextField(
                              controller: firstname,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(

                                // hintText: "Enter First Name"
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/userimg.png"),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Last name",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 35,
                            child: TextField(
                              enabled: false,
                              controller: lastname,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // hintText: "Enter First Name"
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/email.png"),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Email Id",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 35,
                            child: TextField(
                              enabled: false,
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(

                                // hintText: "Enter First Name"
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/dob.png"),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Date of birth ",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
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
                              // dobs = day + month + year;
                              print("my date${day}\n$month\n $year");
                            }
                          },
                          child: SizedBox(
                              height: 35,
                              child: TextField(
                                enabled: false,
                                controller: dob,
                                decoration: InputDecoration(
                                  labelText: "$day/$month/$year",
                                  // hintText: "Enter First Name"
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.transgender),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Gender ",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // dialog(context);
                          },
                          child: SizedBox(
                              height: 35,
                              child: TextField(
                                enabled: false,
                                controller: gender,
                                decoration: InputDecoration(labelText: genders
                                  // hintText: "Enter First Name"
                                ),
                              )),
                        )
                      ],
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

  Future getImageGallery() async {
    final pickfile = await pickimage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        image = File(pickfile.path);
      } else {
        fluttertoast().fluttertoasts("No image selected");
      }
    });
  }

  Future getImagecamera() async {
    final pickfile = await pickimage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        image = File(pickfile.path);
      } else {
        fluttertoast().fluttertoasts("No clicked images");
      }
    });
  }
}
