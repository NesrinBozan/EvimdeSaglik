import 'package:flutter/material.dart';

class MyMoods extends StatefulWidget {
  @override
  _MyMoodsState createState() => _MyMoodsState();
}

class _MyMoodsState extends State<MyMoods> {

  List<bool> isSelected = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        focusColor: Color(0xffFFCDDD),
      selectedBorderColor: Colors.black12,
      renderBorder: false,
      fillColor: Color(0xffFFCDDD),
      children:const <Widget> [
        Icon(Icons.sentiment_very_dissatisfied,size: 32,),


        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Icon(Icons.sentiment_dissatisfied,size: 32,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Icon(Icons.sentiment_neutral,size: 32,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Icon(Icons.sentiment_satisfied,size: 32,),
        ),
        Icon(Icons.sentiment_very_satisfied,size: 32,),

      ],
      isSelected: isSelected,
      onPressed: (int index)
      {
        setState(() {

          for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
          //  isSelected[index] =!isSelected[index];
        });
      },
    ),

    );
  }
}
