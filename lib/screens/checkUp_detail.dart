import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_app/widgets/checkUp_packages.dart';
import 'package:users_app/widgets/utils.dart';


class CheckUp_Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('images/checkUp.jpg'),
              alignment: Alignment.topCenter,
              fit:BoxFit.fitWidth,

          ),
        ),
          child: Column(
            children: [
              SizedBox(
                height: 50,

              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30,
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),

                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(80),

                  ),
                ),
                child: Padding(padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                children: [
                  Image.asset('images/doctor7.png',
                    height: 100,),
                  SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(
                      "Dr.Zehra Umut",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF332d2b),
                      ),
                    ),
                    SizedBox(height: 10,),

                      Text(
                        "Erken tanı için düzenli check-up öneriyor.",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
                    ),
                    SizedBox(height: 40,),
                    Text(
                      "Check Up Neden Yapılmalı ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color:Color(0xFF332d2b),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Herhangi bir sağlık sorunu bulunmayan kişilere yaş, genetik, miras, çevresel ve risk faktörleri dikkate alınarak, sağlık taraması olarak check-up , olası hastalıkların önlenmesi veya var olan rahatsızlıkların erken dönemde tanı alması ve tedavi edilmesi amacıyla düzenli aralıklarla yapılmalıdır.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Text("Check - Up Paketleri",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                          color:Color(0xFF332d2b)
                    ),),

                    SizedBox(height: 20,),
                    CheckUpPackages(
                      "Çocuk Check-up Paketi",
                      "Ç",
                     Colors.blue,


                    ),
                    SizedBox(height: 20,),
                    CheckUpPackages(
                        "Temel Check-up Paketi",
                      "T",
                        Colors.deepPurple,


                    ),
                    SizedBox(height: 20,),
                    CheckUpPackages(
                        "Gold Check-up Paketi",
                      "G",
                        Colors.yellowAccent,


                    ),
                    SizedBox(height: 20,),
                    CheckUpPackages(
                        "Yaşlanma Karşısı Check-up Paketi",
                      "YK",
                      Colors.pink,


                    ),


                  ],

                ),
                ),
              ),
            ],
          ),
      ),
    ),
    );
  }
}
