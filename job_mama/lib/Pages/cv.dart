import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_mama/Widgets/widgets.dart';

import 'Homepage.dart';

class cv_maker extends StatefulWidget {
  const cv_maker({Key? key}) : super(key: key);

  @override
  State<cv_maker> createState() => _cv_makerState();
}

class _cv_makerState extends State<cv_maker> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cv maker"),
          space(20),
          ElevatedButton(
              onPressed: () {
                nextScreen(context, HomePage());
              },
              child: Text("Go go homepage"))
        ],
      )),
    );
  }
}
