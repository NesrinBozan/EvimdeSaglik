import 'package:flutter/material.dart';
class MyText extends StatefulWidget {

  String? name;
  MyText({this.name});
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.name.toString(),
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
