import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:users_app/config/size_config.dart';

class MyAnimatedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween(
        begin:0.0,
      end: SizeConfig.orientation == Orientation.portrait ? SizeConfig.screenHeight: SizeConfig.screenWidth,
      ),
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, child,value){
      return Container(
        width: value,
        height: value,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/welcome.jpg"))),
      )  ;
      },
    );
  }
}
