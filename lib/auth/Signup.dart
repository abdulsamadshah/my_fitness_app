import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Ui/Dashboard.dart';
import '../Utils/fluttertoast.dart';
import '../Utils/roundbtn.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();

  // bool loading = false;
  String? genders;

  final pickimage = ImagePicker();
  File? image;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final postref = FirebaseDatabase.instance.reference().child("Register");
  var day, month, year;
  var dobs;

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
                        selectimagedailog(context);
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
                              dobs = "${day}/${month}/${year}";
                              print("my date${day}\n$month\n $year");
                            }
                          },
                          child: SizedBox(
                              height: 35,
                              child: TextField(
                                enabled: false,
                                controller: dobs,
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
                            dialog(context);
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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.password),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Password ",
                                  style: TextStyle(fontFamily: 'Poppinsmedium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 35,
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                  // hintText: "Enter First Name"
                                  ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 40, bottom: 10),
                  child: Container(
                    child: Roundbtn(
                        loading: true,
                        title: "Register",
                        ontap: () async {
                          try {
                            //create date and time
                            int date = DateTime.now().microsecondsSinceEpoch;
                            //i created image upload and she ref url
                            firebase_storage.Reference ref = firebase_storage
                                .FirebaseStorage.instance
                                .ref("myfitness$date");

                            UploadTask uploadtask =
                                ref.putFile(image!.absolute);
                            await Future.value(uploadtask);
                            //and thend download image url created
                            var newUrl = await ref.getDownloadURL();

                            //and then post the data on firebase database
                            postref.child("users").child(date.toString()).set({
                              "Pid": date.toString(),
                              "userimg": newUrl.toString(),
                              "firstname": firstname.text.toString(),
                              "lastname": lastname.text.toString(),
                              "email_id": email.text.toString(),
                              "dob": dobs.toString(),
                              "gender": genders.toString(),
                              "password": password.text.toString(),
                            }).then((value) {
                              fluttertoast()
                                  .fluttertoasts("Post Uploaded Successfully");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(),
                                  ));
                            }).onError((error, stackTrace) {
                              print(error.toString());
                              fluttertoast().fluttertoasts(error.toString());
                            });
                          } catch (e) {
                            print(e.toString());
                          }
                        }),
                  ),
                )
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
