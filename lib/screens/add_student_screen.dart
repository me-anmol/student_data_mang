import 'package:student_data_mang/components/my_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_data_mang/screens/welcome_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddStudentScreen extends StatefulWidget {
  static String id = "StudentScreen";

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  String name;
  String gender;
  String branch;
  String mobile;
  void saveData() async {
    http.Response res = await http.post(
        Uri.parse("https://10.0.2.2/Student/insert_data.php"),
        body: <String, String>{
          'name': name,
          'gender': gender,
          'branch': branch,
          'mobile': mobile,
        });
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 90.0,
                child: Center(
                  child: Text(
                    "Enter the student Details",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              MyInput(
                hint: "Name",
                onPressed: (value) {
                  name = value;
                },
              ),
              MyInput(
                hint: "Gender",
                onPressed: (value) {
                  gender = value;
                },
              ),
              MyInput(
                hint: "Branch",
                onPressed: (value) {
                  branch = value;
                },
              ),
              MyInput(
                hint: "Mobile",
                onPressed: (value) {
                  mobile = value;
                },
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        "Are you sure",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,  
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            saveData();
                            Fluttertoast.showToast(
                              msg: "The Student data has been saved",
                              fontSize: 18.0,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                            Navigator.popAndPushNamed(
                                context, WelcomeScreen.id);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, "no");
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.all(10.0),
                  width: 250.0,
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
