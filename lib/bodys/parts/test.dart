import 'package:flutter/material.dart';
import '../../data/lesson.dart';

class Test extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: 500,
          color: Colors.purple,
          padding: EdgeInsets.all(20.0),
          child: Text("sdsdsd"),
        ),
        Positioned(
          top: -40,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text("2", style: TextStyle(fontSize: 240.0, color: Colors.white)),
            ),
          )
        )


      ],
    );
  }
}