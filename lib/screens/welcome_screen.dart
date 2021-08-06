import 'package:flutter/material.dart';
import 'package:student_data_mang/components/custom_button.dart';
import 'package:student_data_mang/screens/add_student_screen.dart';
import 'package:student_data_mang/screens/all_list_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "images/book.png",
            ),
            radius: 100.0,
          ),
          SizedBox(
            height: 150.0,
          ),
          Center(
            child: Text(
              "Welcome to the Student Database",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          CustomButton(
            text: "ADD A NEW STUDENT DATA",
            onPressed: () {
              print("hello");
              Navigator.pushNamed(context, AddStudentScreen.id);
            },
          ),
          CustomButton(
            text: "STUDENT LIST",
            onPressed: () {
              print("list");
              Navigator.pushNamed(context, AllDetailScreen.id);
            },
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}