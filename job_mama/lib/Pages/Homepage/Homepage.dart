import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Pages/Show_job/cat_wise_job_show.dart';
import 'package:job_mama/Widgets/widgets.dart';
import 'package:lottie/lottie.dart';
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
                          color: Colors.amberAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.menu_book),
                                SizedBox(width: 10),
                                Text(
                                  "Select job category",
                                  style: GoogleFonts.arvo(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
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
                            Container(
                              width: 400,
                              color: Colors.orangeAccent,
                              child: FlatButton(
                                  onPressed: () {
                                    nextScreen(context, cat_job_show("Sales"));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.app_settings_alt),
                                      Text(
                                        "App Development",
                                        style: GoogleFonts.arvo(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
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
