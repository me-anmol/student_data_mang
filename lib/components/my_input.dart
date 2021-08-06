import 'package:flutter/material.dart';
class MyInput extends StatelessWidget {
  final Function onPressed;
  final String hint;
  MyInput({this.hint, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(19.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: TextField(
          onChanged: onPressed,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
