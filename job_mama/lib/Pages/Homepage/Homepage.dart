import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Pages/Show_job/cat_wise_job_show.dart';
import 'package:job_mama/Widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Show_job/job_show.dart';
import '../User_Access/login.dart';
import '../job_create/new_job_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int count = 0;

class _HomePageState extends State<HomePage> {
  String job_cat = "";
  String Com_name = "";
  String post = "";
  String requirement = "";
  String Location = "";
  String job_type = "";
  String Last_date = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  var _dotPosition = 0;
  List<String> _carouselImages = [];

  fetchCarouselImages() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("slider").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text("Job Bazar"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 249, 147, 57)
          //0.5 is transparency
          ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                color: Color.fromARGB(255, 194, 213, 248),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5,
                    child: CarouselSlider(
                        items: _carouselImages
                            .map((item) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(item),
                                          fit: BoxFit.fitWidth)),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.8,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (val, carouselPageChangedReason) {
                              setState(() {
                                _dotPosition = val;
                              });
                            })),
                  ),
                  SizedBox(height: 10),
                  DotsIndicator(
                    dotsCount: _carouselImages.length == 0
                        ? 1
                        : _carouselImages.length,
                    position: _dotPosition.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Colors.deepOrange,
                      spacing: EdgeInsets.all(2),
                      color: Colors.deepOrange.withOpacity(0.4),
                      activeSize: Size(8, 8),
                      size: Size(6, 6),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Color.fromARGB(255, 72, 112, 145),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Select job category",
                                  style: GoogleFonts.arvo(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      space(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          children: [
                            //development
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(
                                        context, cat_job_show("Development"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.app_settings_alt),
                                      SizedBox(width: 10),
                                      Text(
                                        "Development",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Education
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(
                                        context, cat_job_show("Education"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.cast_for_education),
                                      SizedBox(width: 10),
                                      Text(
                                        "Education",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Sales
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(context, cat_job_show("Sales"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.sell),
                                      SizedBox(width: 10),
                                      Text(
                                        "Sales",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Health Care
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(
                                        context, cat_job_show("Medical Care"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.health_and_safety),
                                      SizedBox(width: 10),
                                      Text(
                                        "Health Care",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Receptionist
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(
                                        context, cat_job_show("Receptionist"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.boy),
                                      SizedBox(width: 10),
                                      Text(
                                        "Receptionist",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Pharmaceutical
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(context,
                                        cat_job_show("Pharmaceutical"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.local_pharmacy_outlined),
                                      SizedBox(width: 10),
                                      Text(
                                        "Pharmaceutical",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Custom
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(context, cat_job_show("Custom"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.dashboard_customize),
                                      SizedBox(width: 10),
                                      Text(
                                        "Custom",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Finance
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(
                                        context, cat_job_show("Finance"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.attach_money),
                                      SizedBox(width: 10),
                                      Text(
                                        "Finance",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),

                            //Others
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 186, 186),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(context, cat_job_show("Others"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.account_balance),
                                      SizedBox(width: 10),
                                      Text(
                                        "Others",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            space(15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextScreen(context, new_job());
        },
        tooltip: "Post a job here",
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
