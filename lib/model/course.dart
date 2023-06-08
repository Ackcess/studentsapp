import 'package:flutter/material.dart';

class Course {
  final String title, description,roled, iconSrc,infos;
  final Color bgColor;

  Course({
    required this.infos,
    required this.title,
    required this.roled,
    this.description = "Designing system operation for blind people",
    this.iconSrc = "assets/icons/email.svg",
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<Course> courses = [
  Course(title: "DS Task",roled: "View your semester results.",infos: "Check your semester results."),

  Course(
    title: "Physics Task",
    roled:"View your semester results.",
    infos: "Check your semester results.",
    iconSrc: "assets/icons/User.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

// We need it later
List<Course> recentCourses = [
  Course(title: "Students List",roled: "(Only For Admins)",infos: "Attendance."),
  Course(
    title: "Attendance",
    roled:"Check",
    infos: "Check Students Attendance.",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/User.svg",
  ),

];

