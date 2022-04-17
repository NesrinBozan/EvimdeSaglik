import 'package:flutter/material.dart';
import 'package:users_app/screens/detail_screen.dart';
import 'package:users_app/widgets/utils.dart';
class TherapyCard extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;
  TherapyCard( this._name,this._description,this._imageUrl,this._bgColor);
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: ()
     {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
     },
      child: DecoratedBox(
          decoration: BoxDecoration(
            color:_bgColor,
            borderRadius: BorderRadius.circular(20),

          ),
        child: Padding(padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Image.asset(_imageUrl),
          title: Text(
            _name,
            style: TextStyle(
              color: AppColors.mainBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _description,
            style: TextStyle(
              color: Colors.black54
            ),
          ),

        ),
        ),
      ),
    );
  }
}
