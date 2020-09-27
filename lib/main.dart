import 'package:flutter/material.dart';
import 'bodys/schedule.dart';
import 'bodys/groupControl.dart';
import 'materialParts/bottomWidget.dart';
import 'bodys/menus.dart';
import 'package:device_info/device_info.dart';

import 'data/globals.dart' as globals;

import 'navs/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {


  AndroidDeviceInfo androidInfo;
  renVal() {
    removeValues();
    trr = false;
    check();
  }

  Future deviceInfo() async{
    DeviceInfoPlugin device = new DeviceInfoPlugin();
    androidInfo = await device.androidInfo;
    return androidInfo.id;
  }

  removeValues() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("group");
  }

  addStringToSF(String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('group', "$str");

  }

  Future checkStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey('group');
    return checkValue;
  }

  Future getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    group = prefs.getString('group');
    print(group);
    trr = true;
    setState(() {

    });
    return group;
  }
  var trr = false;
  getVal(){
    var f = getStringValuesSF();
    f.then((a){return Menus(a, renVal);});
  }

  String group = "";
  bool ch = false;
  Widget body(){

    if(trr == true){
      return Menus(group, renVal);
    }
    if(ch == false){

      return GroupControl(setSt);
    }
    else{
      {
        getVal();

      }
    }
  }

  check(){
    var f = checkStringToSF();
    f.then((a){ch = a; setState(() {
    });});
  }

  @override
  void initState() {
    super.initState();
    check();
    var f = deviceInfo();
    f.then((a){globals.androidIndex = a;});
  }

  void setSt(String text){
    addStringToSF(text);
    check();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        body: body()//Teacher()
      ),
    );
  }
}

