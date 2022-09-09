import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Pages/job_show.dart';
import 'package:job_mama/Pages/login.dart';
import 'package:job_mama/Pages/new_job_form.dart';
import 'package:job_mama/Widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: Color.fromARGB(255, 221, 170, 120),
        //0.5 is transparency
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset('asset/us.jpg'),
                decoration: BoxDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 3.5,
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
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * .85,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: db
                          .collection('Jobs')
                          .where("job_cat", isEqualTo: "Customer Support")
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
                                child: ListTile(
                                  style: ListTileStyle.list,
                                  tileColor: Colors.amber.withOpacity(.2),
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
