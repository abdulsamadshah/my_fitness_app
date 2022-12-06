import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_fitness_app/Ui/Dashboard.dart';
import 'package:image_picker/image_picker.dart';
import '../Utils/roundbtn.dart';
import '../Utils/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

class Uploadcategory extends StatefulWidget {
  const Uploadcategory({Key? key}) : super(key: key);

  @override
  State<Uploadcategory> createState() => _UploadcategoryState();
}

class _UploadcategoryState extends State<Uploadcategory> {
  String dropdownvalue = 'Chest';

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
  var category;
  File? image;
  var pickimage = ImagePicker();
  File? video;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final postref = FirebaseDatabase.instance.reference().child("gymCategory");

  TextEditingController categorys = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController seconddescription = TextEditingController();
  TextEditingController subdescription = TextEditingController();

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
        title: Text("Upload Gym Categor"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
              },
              child: Icon(Icons.home_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    //iamges loading offline
                    padding: const EdgeInsets.only(left: 0, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(),
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
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Container(
                      // Container(
                      width: 320,
                      height: 40,
                      decoration: BoxDecoration(border: Border.all()),
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
                            padding: const EdgeInsets.only(right: 50),
                            child: Container(
                              child: SingleChildScrollView(
                                child: DropdownButton(
                                  // Initial Value
                                  value: dropdownvalue,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: title,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Title ",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Description",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: seconddescription,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Second Description",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: TextField(
                        controller: subdescription,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Sub Description",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        getVideoGallery();
                      },
                      child: Container(
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Upload Video",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                        child: Roundbtn(
                      loading: false,
                      title: "Upload Category",
                      ontap: () async {


                        int date = DateTime.now().microsecondsSinceEpoch;
                        //i created image upload and she ref url
                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref("myfitnessimg$date");

                        UploadTask uploadtask =
                        ref.putFile(image!.absolute);
                        await Future.value(uploadtask);
                        //and thend download image url created
                        var newUrl = await ref.getDownloadURL();


                        //i created image upload and she ref url
                        firebase_storage.Reference videoref = firebase_storage
                            .FirebaseStorage.instance
                            .ref("myfitnessvideo$date");
                        UploadTask videouploadtask =
                        videoref.putFile(video!.absolute);
                        await Future.value(videouploadtask);
                        //and thend download image url created
                        var videourl = await videoref.getDownloadURL();



                        postref
                            .child(dropdownvalue)
                            .child(date.toString())
                            .set({
                          "Pid": date.toString(),
                          "gymimage": newUrl.toString(),
                          "gymvideo": videourl.toString(),
                          "gymtitle": title.text.toString(),
                          "gymdescription": description.text.toString(),
                          "gymseconddescription": seconddescription.text.toString(),
                          "gymsubdescription": subdescription.text.toString(),
                        }).then((value) {
                          fluttertoast().fluttertoasts(
                              "Uploaded Successfully");
                        }).onError((error, stackTrace) {
                          print(error.toString());
                          fluttertoast().fluttertoasts(error.toString());
                        });
                      },
                    )),
                  ),
                ],
              ),
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

//select video
  Future getVideoGallery() async {
    final pickvideo = await pickimage.pickVideo(source: ImageSource.gallery);
    setState(() async {
      if (pickvideo != null) {
        video = File(pickvideo.path);
      } else {
        fluttertoast().fluttertoasts("No Video selected");
      }
    });
  }
}
