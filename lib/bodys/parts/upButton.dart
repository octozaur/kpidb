import 'package:flutter/material.dart';
import 'rkeys.dart';
class UpButton extends StatelessWidget{
  String day;
  String fullDay;
  int i;
  Function() setScroll;

  UpButton(this.day);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: ()=> Scrollable.ensureVisible(key.currentContext),
      child: Container(
        margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
        padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        height: 35.0,
        //width: MediaQuery.of(context).size.width*0.115,
        decoration: BoxDecoration(
          color: const Color(0xffece9f4),
          borderRadius: BorderRadius.all(
              Radius.circular(50.0)
          ),
        ),
        child: Text(
          day, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepPurple[900], height: 1.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}