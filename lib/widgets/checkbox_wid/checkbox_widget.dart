import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxWid extends StatefulWidget {
  const CheckBoxWid({super.key});

  @override
  State<CheckBoxWid> createState() => _CheckBoxWidState();
}

class _CheckBoxWidState extends State<CheckBoxWid> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            Future.delayed(Duration(seconds: 10), () {
              print("1000000000000");
              setState(() {
                isChecked = true;
              });
              print(isChecked);
            });
          },
          child: Text('Reset'),
        ),
      ]
    );
  }
}
