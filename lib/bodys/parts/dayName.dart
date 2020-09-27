import 'package:flutter/material.dart';
import 'rkeys.dart';
import '../../data/customColors.dart';

class DayName extends StatelessWidget{
  final String dayName;
  DayName(this.dayName);



  @override
  Widget build(BuildContext context) {
  return Row(

    children: <Widget>[
      Stack(

        children: <Widget>[
          Container(
            //key: f(),
            margin: const EdgeInsets.fromLTRB(0, 20.0, 10.0, 28.0),
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: CustomColors().accent,
                    width: 3.0
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(50.0)
                )
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 15.0, 10.0, 28.0),
            child: Text(dayName, style: TextStyle(fontSize: 20.0, color: CustomColors().accent, fontWeight: FontWeight.bold)),
          ),
        ],
      )
    ],
  );
  }
}