import 'package:flutter/cupertino.dart';

class CourseDef{
  int? numVideo;
  String? logoCourse;
  String? titleCourse;
  Color? colorBackground;

  CourseDef({
   required this.logoCourse,
   required this.titleCourse,
   required this.colorBackground,
   required this.numVideo});
}