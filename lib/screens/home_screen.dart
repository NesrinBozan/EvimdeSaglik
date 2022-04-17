import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:users_app/widgets/category_card.dart';
import 'package:users_app/widgets/therapy_card.dart';
import 'package:users_app/widgets/utils.dart';

import '../widgets/search_bar.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 100,right: 20),
                  child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_eqCI4X.json',
                  width: 170,height: 170,
                  fit: BoxFit.fill),

                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Hoşgeldiniz",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
                 //const SizedBox(height: 20,),
            //    Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              //   child: SearchBar(),
                //),
                SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Kategoriler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                buildCategoryList(),
                SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,),
                  child: Text(
                    "Popüler Hizmet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                buildTherapyList(),

              ],

            ),
          )),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Hizmetler',
            Icons.medical_services_outlined,
            Color(0xff8946A6),
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Bilgiler',
            Icons.feed,
            Color(0xffEA99D5),
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Şubeler',
            Icons.account_balance,
            Color(0xffFFCDDD),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
  buildTherapyList(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          TherapyCard(
            "Tedavi Paketi 1",
            "Muayene , PCR Test",
            "images/doctor3.png",
            Colors.pink[50],
          ),

          SizedBox(height: 20,),

          TherapyCard(
            "Tedavi Paketi 1",
            "Muayene , PCR Test",
            "images/doctor3.png",
            Colors.deepPurple[50],
          ),

          SizedBox(height: 20,),

          TherapyCard(
            "Tedavi Paketi 1",
            "Muayene , PCR Test",
            "images/doctor3.png",
            Colors.yellow[50],
          ),

          SizedBox(height: 20,),

        ],
      )
    );
  }

}