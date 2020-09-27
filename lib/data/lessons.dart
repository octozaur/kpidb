import 'lesson.dart';

class Lessons{
  final List<Lesson> data;

  Lessons({this.data});

  factory Lessons.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'];
    List<Lesson> lessonList = list.map((i) => Lesson.fromJson(i));


    return Lessons(
        data: lessonList

    );
  }
}