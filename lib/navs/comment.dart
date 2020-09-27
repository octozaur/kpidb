import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget{
  String comment;
  double stars;

  Comment(this.stars, this.comment);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Divider(
              height: 40.0,
              color: Colors.blueGrey,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Container(

                    child: Text("$stars", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                ),
                Container(
                    width: 25.0,
                    child: IconButton(
                      icon: Icon(stars >= 1 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 25.0,),
                    )
                ),
                Container(
                    width: 25.0,
                    child: IconButton(
                      icon: Icon(stars >= 2 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 25.0,),
                    )
                ),
                Container(
                    width: 25.0,
                    child: IconButton(
                      icon: Icon(stars >= 3 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 25.0,),
                    )
                ),
                Container(
                    width: 25.0,
                    child: IconButton(
                      icon: Icon(stars >= 4 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 25.0,),
                    )
                ),
                Container(
                    width: 25.0,
                    child: IconButton(
                      icon: Icon(stars >= 5 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 25.0,),
                    )
                ),
              ],
            ),
          ),
          if(comment != "")
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Text("$comment", style: TextStyle(fontSize: 16.0), textAlign: TextAlign.start,),
            )
        ],
      ),
    );
  }
}