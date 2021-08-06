import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_data_mang/components/student_data.dart';
import 'package:student_data_mang/screens/update_screen.dart';

class AllDetailScreen extends StatefulWidget {
  static String id = "AllDetailScreen";

  @override
  _AllDetailScreenState createState() => _AllDetailScreenState();
}

class _AllDetailScreenState extends State<AllDetailScreen> {
  Future data;
  Future getData() async {
    List<StudentData> temp = [];
    http.Response response =
        await http.get(Uri.parse("https://10.0.2.2/Student/fetch_data.php"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var dataList = jsonDecode(response.body);
      dataList.forEach((element) {
        print(element);
        StudentData help = StudentData(
          id: int.parse(element['id']),
          name: element['Name'],
          branch: element['branch'],
          mobile: element['mobile'],
          gender: element['gender'],
        );
        temp.add(help);
      });
      return temp;
    }
  }

  void deleteData(int id) async {
    http.Response res = await http.post(
      Uri.parse("https://10.0.2.2/Student/delete_data.php"),
      body: <String, String>{
        'id': id.toString(),
      },
    );
    print(res.body);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Gender: " + snapshot.data[index].gender,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Branch: " + snapshot.data[index].branch,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Mobile: " + snapshot.data[index].mobile,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return UpdateScreen(toBeUpdated: snapshot.data[index].id,);
                                  }));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Center(
                                      child: Text(
                                    "Update",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  deleteData(snapshot.data[index].id);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Center(
                                      child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        }

        return Container(
          child: Center(
            child: Text("Loading......"),
          ),
        );
      },
    ));
  }
}
