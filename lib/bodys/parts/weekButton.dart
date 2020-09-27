import 'package:flutter/material.dart';

class WeekButton extends StatelessWidget{
  String week;
  Function() weekCh;
  WeekButton(this.week, this.weekCh);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: (){print(1); weekCh();},
      child: Container(
        margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
        height: 35.0,
        width: MediaQuery.of(context).size.width*0.17,
        decoration: BoxDecoration(
          color: const Color(0xffece9f4),
          borderRadius: BorderRadius.all(
              Radius.circular(50.0)
          ),
        ),
        child: Text(
          week, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12.0, color: Colors.deepPurple[900], height: 1.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}