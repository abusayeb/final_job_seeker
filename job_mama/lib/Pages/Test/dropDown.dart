import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  var _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown'),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButton<String>(
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.black),

              items: <String>[].map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              hint: const Text(
                "Please choose a langauage",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              onChanged: (value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
