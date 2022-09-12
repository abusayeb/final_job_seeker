import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_mama/Pages/Homepage/Homepage.dart';
import 'package:job_mama/Pages/Test/new_job_form_test.dart';
import 'package:job_mama/Widgets/widgets.dart';

class cv_maker extends StatefulWidget {
  const cv_maker({Key? key}) : super(key: key);

  @override
  State<cv_maker> createState() => _cv_makerState();
}

class _cv_makerState extends State<cv_maker> {
  String first_name = "";
  String last_name = "";
  String fathers_name = "";
  String mothers_name = "";
  String per_villageOrStreet = "";
  String per_upzila = "";
  String per_district = "";
  String per_division = "";
  String per_post_code = "";
  String per_country = "";
  String pre_villageOrStreet = "";
  String pre_upzila = "";
  String pre_district = "";
  String pre_division = "";
  String pre_post_code = "";
  String pre_country = "";
  String birthday = "";
  String email = "";
  String ssc_grade = "";
  String hsc_grade = "";
  String honours_grade = "";
  String masters_grade = "";
  bool isCheck_ssc = false;
  bool isCheck_hsc = false;
  bool isCheck_honours = false;
  bool isCheck_masters = false;
  bool isCheck_add = true;
  String nid = "";
  String mar_status = "";

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CV DETAILS",
            style: GoogleFonts.aldrich(
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          // backgroundColor: Color.fromARGB(255, 221, 170, 120),
          //0.5 is transparency
        ),
        body: Container(
            height: MediaQuery.of(context).size.height * 90,
            width: MediaQuery.of(context).size.width * 95,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 194, 213, 248),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name text field
                      Row(
                        children: [
                          //First name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 160,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "  First Name  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),
                              //Fathers name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "First Name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      first_name = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "Name field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),

                          //Last name

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 130,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "  Last Name  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),

                              //Last name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Last Name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      last_name = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "Name field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      space(15),

                      //Fathers name & mothers name

                      Row(
                        children: [
                          //Fathers name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 130,
                                alignment: Alignment.center,
                                child: Text(
                                  " Fathers Name  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),

                              //Fathers name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Fathers Name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      fathers_name = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),

                          //Mothers name

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 130,
                                alignment: Alignment.center,
                                child: Text(
                                  " Mothers Name  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),

                              //Mothers name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Mothers Name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      mothers_name = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      space(15),

                      //Permanent address
                      //Permanent address
                      //Permanent address
                      //Permanent address

                      Container(
                        height: 20,
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: Text(
                          " Permanent Address  :",
                          style: GoogleFonts.arvo(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      space(5),
                      Row(
                        children: [
                          //Left side permanent address
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //village
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Village/Street name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_villageOrStreet = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //Upozila
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Upozila/City corporation",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_upzila = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),

                              space(10),

                              //Division field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Division",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_division = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10),

                          //right side

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Post code field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Post code",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_post_code = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //District field

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "District",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_district = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //Country field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Country",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      per_country = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      space(15),

                      //Present address
                      //Present address
                      //Present address
                      //Present address
                      //Present address

                      Container(
                        height: 20,
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: Text(
                          " Present Address  :",
                          style: GoogleFonts.arvo(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      space(5),

                      Row(
                        children: [
                          Text(
                            " Similar to permanent address?",
                            style: GoogleFonts.aldrich(),
                          ),
                          Checkbox(
                              value: isCheck_add,
                              onChanged: (val) {
                                setState(() {
                                  isCheck_add = val!;
                                });
                              }),
                        ],
                      ),
                      space(5),

                      Row(
                        children: [
                          //Left side permanent address
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //village
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Village/Street name",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_villageOrStreet = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //Upozila
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Upozila/City corporation",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_upzila = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),

                              space(10),

                              //Division field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Division",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_division = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10),

                          //right side

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Post code
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Post code",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_post_code = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //District field

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "District",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_district = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                              space(10),

                              //Country field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: !isCheck_add,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Country",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      pre_country = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //Birth day & email
                      //Birth day & email
                      //Birth day & email
                      //Birth day & email
                      //Birth day & email
                      //Birth day & email

                      Row(
                        children: [
                          //Birthday
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 120,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  " Birthday  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),
                              //Birthday field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "26/10/2000",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      birthday = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),

                          //Email

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 130,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "  Email  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Enter Email",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  validator: (val) {
                                    bool isValid =
                                        EmailValidator.validate(val!);
                                    return isValid
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      space(15),

                      //Educational qualification
                      //Educational qualification
                      //Educational qualification
                      //Educational qualification

                      Container(
                        height: 20,
                        width: 300,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          " Educational Qualifications  :",
                          style: GoogleFonts.arvo(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      space(3),

                      //Checkbox and exam field
                      //Checkbox and exam field
                      //Checkbox and exam field

                      Column(
                        children: [
                          //ssc row
                          Row(
                            children: [
                              Checkbox(
                                  value: isCheck_ssc,
                                  onChanged: (val) {
                                    setState(() {
                                      isCheck_ssc = val!;
                                    });
                                  }),
                              // SizedBox(width: 5),
                              Text("SSC",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic)),

                              SizedBox(width: 40),

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: isCheck_ssc,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "SSC GPA",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      ssc_grade = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty!";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          space(2),

                          //HSC row
                          Row(
                            children: [
                              Checkbox(
                                  value: isCheck_hsc,
                                  onChanged: (val) {
                                    setState(() {
                                      isCheck_hsc = val!;
                                    });
                                  }),
                              // SizedBox(width: 5),
                              Text("HSC",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic)),

                              SizedBox(width: 39),

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: isCheck_hsc,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "HSC GPA",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      hsc_grade = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          //Honours result

                          Row(
                            children: [
                              Checkbox(
                                  value: isCheck_honours,
                                  onChanged: (val) {
                                    setState(() {
                                      isCheck_honours = val!;
                                    });
                                  }),
                              // SizedBox(width: 5),
                              Text("Honours",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic)),

                              SizedBox(width: 10),

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: isCheck_honours,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Honours CGPA",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      honours_grade = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          //Masters

                          Row(
                            children: [
                              Checkbox(
                                  value: isCheck_masters,
                                  onChanged: (val) {
                                    setState(() {
                                      isCheck_masters = val!;
                                    });
                                  }),
                              // SizedBox(width: 5),
                              Text("Masters",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontStyle: FontStyle.italic)),

                              SizedBox(width: 15),

                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  enabled: isCheck_masters,
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Masters CGPA",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      masters_grade = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      space(15),

                      //Marital status and National Id number
                      Row(
                        children: [
                          //First name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 160,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "  Marital Status  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),
                              //Fathers name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Married/Unmarried",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      mar_status = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),

                          //Last name

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 130,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "  NID No  :",
                                  style: GoogleFonts.arvo(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              space(3),

                              //First name field
                              Container(
                                width: 165,
                                height: 40,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "NID no",
                                      hintStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      nid = value;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "This field can't be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      space(15),

                      //submit button

                      Center(
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(.3),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: FlatButton(
                              onPressed: () {
                                submit();
                              },
                              child: Text(
                                "SUBMIT",
                                style: GoogleFonts.aldrich(fontSize: 20),
                              )),
                        ),
                      ),
                      space(30),
                    ],
                  ),
                ),
              ),
            )));
  }

  void submit() {
    if (formkey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      Navigator.pop(context);

      AlertDialog(
        content: Text("CV submitted successfully!"),
        actions: [
          ElevatedButton(
              onPressed: () {
                nextScreen(context, HomePage());
              },
              child: Text("Ok")),
        ],
      );
    }
  }
}
