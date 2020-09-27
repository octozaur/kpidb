class Lesson{

  final String lessonId;
  final String groupId;
  final String dayNumber;
  final String dayName;
  final String lessonName;
  final String lessonFullName;
  final String lessonNumber;
  String lessonRoom;
  final String lessonType;
  final String teacherName;
  final String lessonWeek;
  final String timeStart;
  final String timeEnd;
  final String rate;

  Lesson({this.lessonId, this.groupId, this.dayNumber, this.dayName, this.lessonName, this.lessonFullName,
      this.lessonNumber, this.lessonRoom, this.lessonType, this.teacherName, this.lessonWeek, this.timeStart,
      this.timeEnd, this.rate});

  factory Lesson.fromJson(Map<String, dynamic> json){
    return Lesson(
        lessonId: json['lesson_id'],
        groupId: json['group_id'],
        dayNumber: json['day_number'],
        dayName: json['day_name'],
        lessonName: json['lesson_name'],
        lessonFullName: json['lesson_full_name'],
        lessonNumber: json['lesson_number'],
        lessonRoom: json['lesson_room'],
        lessonType: json['lesson_type'],
        teacherName: json['teacher_name'],
        lessonWeek: json['lesson_week'],
        timeStart: json['time_start'],
        timeEnd: json['time_end'],
        rate: json['rate']
    );
  }
}