import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/screens/home_screen.dart';
import 'package:users_app/screens/mapScreen.dart';
import 'package:users_app/screens/profile_screen.dart';



class HomePageState extends StatefulWidget {
  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  int index=0;
  final screens =[
    HomeScreen(),
    MapScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final items= <Widget>[

      Icon(Icons.home,size: 30),
      Icon(Icons.medical_services_outlined,size: 30),
      Icon(Icons.person,size: 30),
    ];

    return SafeArea(

      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xff8946A6),
        body: screens[index],
        bottomNavigationBar: Theme(
         data: Theme.of(context).copyWith(
           iconTheme: IconThemeData(color: Colors.white),
         ),
          child: CurvedNavigationBar(
            color: Color(0xffB762C1),
            buttonBackgroundColor: Color(0xff8946A6),
            backgroundColor: Colors.transparent,
            height: 50,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            index: index,
            items: items,
          onTap: (index)=>setState(() =>this.index =index),

          ),
        ),
      ),
    );
  }
}
