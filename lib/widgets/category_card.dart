import 'package:flutter/material.dart';
import 'package:users_app/screens/detail_screen.dart';
import 'package:users_app/widgets/services_card.dart';

class CategoryCard extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;




  CategoryCard(this._title, this._imageUrl, this._bgColor,);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesCard()));


      },
      onDoubleTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen ()));
      },
      child: Container(
        width: 120,
        height: 140,
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 137,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    _title,
                    style: TextStyle(
                      color:Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  _imageUrl,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}