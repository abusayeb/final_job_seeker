import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../Homepage/Homepage.dart';
import '../User_Access/login.dart';

class new_job extends StatefulWidget {
  const new_job({Key? key}) : super(key: key);

  @override
  State<new_job> createState() => _new_jobState();
}

class _new_jobState extends State<new_job> {
  List<dynamic> jobs = [];

  List<dynamic> tags = [];

  String? jobId = "";
  String? tagsId = "";
  final formkey = GlobalKey<FormState>();

  String job_cat = "";
  String Com_name = "";
  String post = "";
  String requirement = "";
  String Location = "";
  String job_type = "";
  String Last_date = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  var cat;
  var type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ElevatedButton(
            onPressed: () async {
              await _auth.signOut();
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              nextScreen(context, LogIn());
            },
            child: Text("LogOut"),
          ),
        ),
        appBar: AppBar(
          title: Text("JOB BAZAR"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space(30),

                      text("Job Category"),
                      space(5),

                      //Category Box

                      Container(
                        height: 60,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 241, 226, 226),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(0.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton<String>(
                            value: cat,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black),

                            items: <String>[
                              'Development',
                              'Education',
                              'Sales',
                              'Health Care',
                              'Receptionist',
                              'Pharmaceutical',
                              'Custom',
                              'Finance',
                              'Others'
                            ].map((j_cat) {
                              return DropdownMenuItem(
                                child: Text(j_cat),
                                value: j_cat,
                              );
                            }).toList(),
                            hint: Text(
                              "Please choose a job Category             ",
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                cat = value;
                                print(cat);
                                print(cat.runtimeType);
                              });
                            },
                          ),
                        ),
                      ),
                      space(10),

                      //Company name textfield

                      text("Company Name"),
                      space(2),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Company Name",
                            hintStyle:
                                GoogleFonts.lato(fontStyle: FontStyle.italic)),
                        onChanged: (value) {
                          setState(() {
                            Com_name = value;
                          });
                        },
                        validator: (value) {
                          if (value!.length == 0)
                            return "Please enter company name";
                        },
                      ),

                      //Post textfield

                      text("Post Name"),
                      space(2),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Assistant Software Engineer",
                            hintStyle:
                                GoogleFonts.lato(fontStyle: FontStyle.italic)),
                        onChanged: (value) {
                          setState(() {
                            post = value;
                          });
                        },
                        validator: (value) {
                          if (value!.length == 0)
                            return "Please enter the post name";
                        },
                      ),

                      //Requirements Field
                      text("Requirements"),
                      space(2),
                      TextFormField(
                        maxLength: 200,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        decoration: textInputDecoration.copyWith(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: "What is your requirement? ",
                            hintStyle:
                                GoogleFonts.lato(fontStyle: FontStyle.italic)),
                        onChanged: (value) {
                          setState(() {
                            requirement = value;
                          });
                        },
                        validator: (value) {
                          if (value!.length < 10)
                            return "Must be at least 10 letters";
                        },
                      ),

                      //Job type choose

                      Container(
                        height: 60,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 241, 226, 226),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(0.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton<String>(
                            value: type,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black),

                            items: <String>[
                              'Full-Time',
                              'Part-TIme',
                              'Conditional'
                            ].map((j_type) {
                              return DropdownMenuItem(
                                child: Text(j_type),
                                value: j_type,
                              );
                            }).toList(),
                            hint: Text(
                              "Please choose a job type                       ",
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                type = value;
                                print(type.runtimeType);
                                print(type);
                              });
                            },
                          ),
                        ),
                      ),
                      space(10),
                      //Job Location

                      text("Location"),
                      space(2),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Enter the location",
                            hintStyle:
                                GoogleFonts.lato(fontStyle: FontStyle.italic)),
                        onChanged: (value) {
                          setState(() {
                            Location = value;
                          });
                        },
                        validator: (value) {
                          if (value!.length == 0)
                            return "Please enter job location";
                        },
                      ),

                      //Deadline

                      text("Deadline"),
                      space(2),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "25 June,2020",
                            hintStyle:
                                GoogleFonts.lato(fontStyle: FontStyle.italic)),
                        onChanged: (value) {
                          setState(() {
                            Last_date = value;
                          });
                        },
                        validator: (value) {
                          if (value!.length == 0)
                            return "This Field can't be null";
                        },
                      ),

                      space(10),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Post",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () {
                      Post();
                    },
                  ),
                ),
                space(50)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Post() async {
    if (formkey.currentState!.validate()) {
      final firestore = FirebaseFirestore.instance;
      firestore.collection('test').add({
        "com_name": Com_name,
        "job_cat": cat,
        "Job_type": type,
        "last_date": Last_date,
        "location": Location,
        "post_name": post,
        "requirement": requirement,
        "time": FieldValue.serverTimestamp(),
      });

      nextScreen(context, HomePage());
    }
  }
}

// "com_name": Com_name,
//         "job_cat": jobs[int.parse(job_cat)]['label'],
//         "Job_type": jobs[int.parse(job_type)]['label'],
//         "last_date": Last_date,
//         "location": Location,
//         "post_name": post,
//         "requirement": requirement