class Teacher{

  String teacherId;
  String teacherName;
  String teacherFullName;
  String teacherShortName;
  Map<double, String> commentsRatings;
  var ratings;
  var comments;
  var ids;
  double currentRating = 0;

  Teacher({this.teacherId, this.teacherName, this.teacherFullName, this.teacherShortName});

  factory Teacher.fromJson(Map<String, dynamic> json){
    return Teacher(
        teacherId: json['teacher_id'],
        teacherName: json['teacher_name'],
        teacherFullName: json['teacher_full_name'],
        teacherShortName: json['teacher_short_name']
    );
  }
}