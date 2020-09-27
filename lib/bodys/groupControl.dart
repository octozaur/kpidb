import 'package:flutter/material.dart';
import 'menus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroupControl extends StatefulWidget{
  Function(String body) st;
  GroupControl(this.st);

  @override
  _GroupControl createState() => _GroupControl(st);
}

class _GroupControl extends State<GroupControl>{
  String group = "";
  Function(String) st;
  _GroupControl(this.st);

  Future fetch(String text) async{
    var response = await http.get('https://api.rozklad.org.ua/v2/groups/$text');
    if (response.statusCode == 200) {
      var sc = json.decode(response.body);
      var r = sc["message"];
      return r;
    }
    else {
      throw Exception('Failed to load post');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 35.0),
              width: 350.0,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0),
              margin: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),

              child: Center(
                child: TextField(
                  style: TextStyle(
                      height: 1.5,fontSize: 18.0
                  ),
                  onSubmitted: (text){var f = fetch(text).then((a){if(a == "Group not found"){print("not found group");setState(() {});}else{st(text);}});},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 25, left: 20.0),
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}