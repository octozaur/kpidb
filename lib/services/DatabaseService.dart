import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/teacher.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseService{

  DatabaseService();

  var kpidbCollection = Firestore.instance;

  Future fetch() async{
    var response = await http.get('https://https://api.rozklad.org.ua/v2/teachers');
    if (response.statusCode == 200) {
      var sc = json.decode(response.body);
      var r = sc["data"] as List;
      var teachers = r.map<Teacher>((json) => Teacher.fromJson(json)).toList();
      for(var t in teachers){
        kpidbCollection.document("${t.teacherId}").setData({
          "teacher_id": t.teacherId,
          "teacher_name": t.teacherName,
          "teacher_full_name": t.teacherFullName,
          "teacher_ratings": t.teacherId
        });
      }
      //return exGroup;
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future updateProfessors(int teacherId, String teacherName, String teacherFullName, List<double> teacherRatings, List<String> teacherComents, double teacherRating) async{


    await kpidbCollection.document("dfff").setData({
      "teacher_id": teacherId,
      "teacher_full_name": teacherFullName,
      "ddd": [],
      "ddddd": [5, 56],
      "sdsdsd": {},
    });
  }


  Future delete() async{
    return await kpidbCollection.document("123").delete();
  }
}