import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  final void Function() f;
  Settings(this.f);

  @override
  _Settings createState() => _Settings(this.f);
}

class _Settings extends State<Settings> {
  final void Function() f;
  _Settings(this.f);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KPIdb'),
        backgroundColor: Color(0xff2b0098),
        actions: <Widget>[],
      ),
      body: Container()
    );
  }
}