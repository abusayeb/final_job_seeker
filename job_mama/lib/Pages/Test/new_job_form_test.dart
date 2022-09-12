import 'package:flutter/material.dart';

class checkBox extends StatefulWidget {
  const checkBox({super.key, required bool value});

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  @override
  bool isChecked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Checkbox(
          value: isChecked,
          onChanged: (val) {
            setState(() {
              isChecked = val!;
            });
          },
        ),
      ),
    );
  }
}
