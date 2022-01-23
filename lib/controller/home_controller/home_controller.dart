import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/models/course_defenation.dart';

class HomeController extends GetxController{
  int currentIndex = 0;
  List<String> courseCategory = [
    'All Courses',
    'Identity',
    'UI/UX',
    'Branding',
    'Programming',
    'Development',
    'Python',
    'Flutter',
    'Native',
  ];

  List<CourseDef> courseListDef = [
    CourseDef(
        logoCourse: 'assets/images/course1.svg',
        titleCourse: 'Logo Design: From Concept to Presentation',
        colorBackground: Color(0xffFEF7DF),
        numVideo: 20),
    CourseDef(
        logoCourse: 'assets/images/course2.svg',
        titleCourse: 'Brand Design and Packaging',
        colorBackground: Color(0xffEBFDFF),
        numVideo: 14),
    CourseDef(
        logoCourse: 'assets/images/course3.svg',
        titleCourse: 'Flutter Development',
        colorBackground: Color(0xffFFF1EF),
        numVideo: 35),
    CourseDef(
        logoCourse: 'assets/images/course2.svg',
        titleCourse: 'Brand Design and Packaging',
        colorBackground: Color(0xffEBFDFF),
        numVideo: 14),
  ];

  void onTap(index) {
    currentIndex = index;
    update();
  }
}