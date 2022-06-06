import 'dart:async';
import 'package:flutter/material.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/screens/onboarding_screen.dart';



class MySplashScreen extends StatefulWidget {
  
  
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){

    fAuth.currentUser != null?  AssistantMethods.readCurrentOnlineUserInfo() : null;

    Timer( const Duration(seconds:2),() async{

      Navigator.push(context, MaterialPageRoute(builder: (c)=> OnboardingScreen()));

    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff8946A6),
              Color(0xffFFCDDD),
            ],
          ),
        ),

      ),
    );
  }
}
