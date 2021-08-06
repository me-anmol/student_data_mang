import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_data_mang/screens/update_screen.dart';
import 'package:student_data_mang/screens/welcome_screen.dart';
import 'package:student_data_mang/screens/add_student_screen.dart';
import 'package:student_data_mang/screens/all_list_screen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  return runApp(StudentApp());
}

class StudentApp extends StatefulWidget {

  @override
  _StudentAppState createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        AddStudentScreen.id : (context) => AddStudentScreen(),
        AllDetailScreen.id :(context)=> AllDetailScreen(),
        UpdateScreen.id : (context) => UpdateScreen(),
      }
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}




