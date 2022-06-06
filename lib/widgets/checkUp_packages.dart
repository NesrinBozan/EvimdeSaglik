import 'package:flutter/material.dart';

class CheckUpPackages extends StatelessWidget {
  var _title;
  var _letter;
  var _bgColor;

  CheckUpPackages(this._title,this._letter,this._bgColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: _bgColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
        ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: _bgColor.withOpacity(0.3),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               _letter,style: TextStyle(
                color: _bgColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
              )
            ],
          ),
        ),
        title: Text(_title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF332d2b),

        ),),

    ),),
    );
  }
}
