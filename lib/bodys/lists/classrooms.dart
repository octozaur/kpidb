import 'package:flutter/material.dart';
import 'package:kpidb/bodys/lists/teachersTeacher.dart';
import '../../services/DatabaseService.dart';
import '../../data/customColors.dart';

class Classrooms extends StatefulWidget {

  var classrooms;
  Classrooms(this.classrooms);

  @override
  _Classrooms createState() => _Classrooms(classrooms);
}

class _Classrooms extends State<Classrooms> {

  var classrooms;
  var ratings = new List<double>();
  double rating = 0;

  _Classrooms(this.classrooms);

  Future fetch() async {
    //var db = await DatabaseService().kpidbCollection.collection("classrooms").getDocuments();

    print(2323232323);
    var db;
    for (var c in classrooms) {
      print(c);
      db = await DatabaseService().kpidbCollection.collection("classrooms").document("$c").get;
      print(db.data["current_rating"]);
      if (db.data["current_rating"] is double) {
        ratings.add(double.parse(db.data["current_rating"].toStringAsFixed(2)));
      }
      else {
        ratings.add(double.parse(db.data["current_rating"].toString()));
      }
      //db.documents.forEach((doc){
      //      print("${doc.data["current_rating"]}sssssssssssssssssssssssssssssssssss");
      //      if(doc.data["current_rating"] is double){
      //        ratings.add(double.parse(doc.data["current_rating"].toStringAsFixed(2)));
      //      }
      //      else{
      //        ratings.add(double.parse(doc.data["current_rating"].toString()));
      //      }
      //    });
    }
  }

    var t = false;
    @override
    void initState() {
      super.initState();
      var f = fetch();
      f.then((f) {
        t = true;
        print("drdrdrdrdrdr");
        setState(() {

        });
      });
    }

    @override
    Widget build(BuildContext context) {
      int i = -1;
      return Scaffold(
          appBar: AppBar(
            title: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset('assets/images/logo_white.png'),
            ),
            centerTitle: true,
            backgroundColor: CustomColors().main,
          ),
          body: ListView(
            children: <Widget>[
              if(t == true)
                ...classrooms.map((a) {
                  i++;
                  rating = ratings[i];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TeachersTeacher(a)));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      padding: EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors().shadow,
                            blurRadius: 10.0,
                            // has the effect of softening the shadow
                            spreadRadius: 5.0, // has the effect of extending the shadow
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text("$a", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: CustomColors().text3),
                              textAlign: TextAlign.left,),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(

                                    child: Text("$rating", style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),)
                                ),
                                Container(
                                    width: 30.0,
                                    child: IconButton(
                                      icon: Icon(
                                        rating >= 1 ? Icons.star : Icons
                                            .star_border,
                                        color: CustomColors().star, size: 30.0,),
                                    )
                                ),
                                Container(
                                    width: 30.0,
                                    child: IconButton(
                                      icon: Icon(
                                        rating >= 2 ? Icons.star : Icons
                                            .star_border,
                                        color: CustomColors().star, size: 30.0,),
                                    )
                                ),
                                Container(
                                    width: 30.0,
                                    child: IconButton(
                                      icon: Icon(
                                        rating >= 3 ? Icons.star : Icons
                                            .star_border,
                                        color: CustomColors().star, size: 30.0,),
                                    )
                                ),
                                Container(
                                    width: 30.0,
                                    child: IconButton(
                                      icon: Icon(
                                        rating >= 4 ? Icons.star : Icons
                                            .star_border,
                                        color: CustomColors().star, size: 30.0,),
                                    )
                                ),
                                Container(
                                    width: 30.0,
                                    child: IconButton(
                                      icon: Icon(
                                        rating >= 5 ? Icons.star : Icons
                                            .star_border,
                                        color: CustomColors().star, size: 30.0,),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            ],
          )
      );
    }
  }