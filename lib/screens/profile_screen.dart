import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/widgets/moods.dart';
import 'package:users_app/widgets/styleguide.dart';
import 'package:users_app/widgets/utils.dart';
class ProfileScreen extends StatefulWidget {

  //String? name;
  //ProfileScreen({this.name});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),



    );
  }

  Stack _buildTopStack() {
    return Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _buildBackgroundCover(),
               _buildGreetings(),
              _buildMoodsHolder(),
            ],
          );
  }

  _buildBackgroundCover() {
    return Container(
      height: 200.0,
      decoration: const BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )
      ),
    );
  }

  _buildGreetings() {
    return Positioned(
      left: 20.0,
      bottom: 46.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Zeynep',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8,),
          Text("Bugün nasıl hissediyorsun?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          ),
          // MyText(name: userModelCurrentInfo!.name,)
        ],
      ),
    );
  }

  _buildMoodsHolder() {
    return Positioned(
      bottom: -35,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width-40,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )
          ]
        ),
        child: MyMoods(),

      ),
    );
  }
}

