import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/customColors.dart';

import '../services/DatabaseService.dart';
import '../data/globals.dart' as globals;

class TeacherW extends StatefulWidget {
   var teacherId;
   TeacherW(this.teacherId);
  @override
  _TeacherW createState() => _TeacherW(teacherId);
}

class _TeacherW extends State<TeacherW> {
  var teacherId;
  _TeacherW(this.teacherId);
  
  double starIndex = 0;
  String comment = "";

  Future updateDB() async {
    if(starIndex != 0){
      List<String> str = new List<String>();
      var res = await DatabaseService().kpidbCollection.collection("teachers").document(teacherId).get();
      for(var rr in res["comments"]){
        print("$rr sssssssssssssssss");
        str.add(rr);
      }
      str.add(comment);
      List<String> ids = new List<String>();
      for(var rr in res["android_ids"]){
        print("$rr sssssssssssssssss");
        ids.add(rr);
      }
      ids.add(globals.androidIndex);
      List<double> dbl = new List<double>();
      int i = 0;
      double sum = 0;
      for(var rr in res["ratings"]){
        dbl.add(rr);
        print("$rr rrrrrrrrrrrrrrrrrr");
        sum = sum + rr;
        i++;
        print("$sum dddddddddddddddddd");
      }
      dbl.add(starIndex);
      sum = sum + starIndex;
      i++;
      if(i>0)
        sum = sum / i;
      await DatabaseService().kpidbCollection.collection("teachers").document(teacherId).updateData({
        "ratings": dbl,
        "comments": str,
        "android_ids": ids,
        "current_rating": sum,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: CustomColors().shadow,
      body: Container(

        alignment: Alignment.center,
        child: Container(
          height: 320.0,
          width: 320.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0)
              ),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 35.0, bottom: 10.0),
                child: Text(
                  "Оцінити викладача:"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(starIndex >= 1 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                        onPressed: (){starIndex = 1; setState(() {});},
                      )
                  ),
                  Container(
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(starIndex >= 2 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                        onPressed: (){starIndex = 2; setState(() {});},
                      )
                  ),
                  Container(
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(starIndex >= 3 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                        onPressed: (){starIndex = 3; setState(() {});},
                      )
                  ),
                  Container(
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(starIndex >= 4 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                        onPressed: (){starIndex = 4; setState(() {});},
                      )
                  ),
                  Container(
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(starIndex >= 5 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                        onPressed: (){starIndex = 5; setState(() {});},
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text("$starIndex", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: Text(
                    "Залишити коментар:"
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    onChanged: (text){comment = text;},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().text11,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Коментар...",
                      )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){Navigator.pop(context);},
                    textColor: CustomColors().text2,
                    color: CustomColors().accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text("Cancel", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                  ),
                  FlatButton(
                    onPressed: (){updateDB().then((val){Navigator.pop(context);});},
                    textColor: CustomColors().text2,
                    color: CustomColors().acept,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text("Submit", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}