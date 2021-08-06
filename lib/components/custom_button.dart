import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  CustomButton({this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
            color: Colors.lightBlue),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}