import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Pages/Show_job/job_show.dart';
import 'package:job_mama/Pages/job_create/new_job_form.dart';
import 'package:job_mama/Widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../User_Access/login.dart';

class cat_job_show extends StatefulWidget {
  String cat = "";
  cat_job_show(String st) {
    cat = st;
    print(cat);
  }

  @override
  State<cat_job_show> createState() => _cat_job_showState();
}

int count = 0;

class _cat_job_showState extends State<cat_job_show> {
  String job_cat = "";
  String Com_name = "";
  String post = "";
  String requirement = "";
  String Location = "";
  String job_type = "";
  String Last_date = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String cat = widget.cat;
    return Scaffold(
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
        title: Text(
          "Job Bazar",
          style: GoogleFonts.aldrich(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        // backgroundColor: Color.fromARGB(255, 221, 170, 120),
        //0.5 is transparency
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Center(
                child: Container(
                  color: Color.fromARGB(255, 194, 213, 248),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .85,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: db
                          .collection('test')
                          .where("job_cat", isEqualTo: "$cat")
                          .snapshots(),
                      builder: ((context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView(
                            scrollDirection: Axis.vertical,
                            children: snapshot.data!.docs.map((doc) {
                              return Card(
                                color: Color.fromARGB(255, 87, 85, 85),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  style: ListTileStyle.list,
                                  tileColor:
                                      //  Colors.grey[300],
                                      // Color.fromARGB(255, 241, 233, 181),
                                      const Color.fromARGB(255, 191, 186, 186),
                                  subtitle:
                                      Text("Deadline : ${doc["last_date"]}"),
                                  title: Text(
                                    "Post : " +
                                        "${doc['post_name']}" +
                                        "\n"
                                            "Company : " +
                                        doc['com_name'],
                                    style: GoogleFonts.arvo(
                                      fontSize: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    job_cat = doc['job_cat'].toString();
                                    Com_name = doc['com_name'].toString();
                                    post = doc['post_name'].toString();
                                    requirement = doc['requirement'].toString();
                                    Location = doc['location'].toString();
                                    job_type = doc['Job_type'].toString();
                                    Last_date = doc['last_date'].toString();
                                    nextScreen(
                                        context,
                                        job_show(
                                            job_cat,
                                            Com_name,
                                            post,
                                            requirement,
                                            Location,
                                            Last_date,
                                            job_type));
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
