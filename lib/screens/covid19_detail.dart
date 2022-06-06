import 'package:flutter/material.dart';
import 'package:users_app/widgets/utils.dart';


class Covid19Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(

        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('images/covid19.jpeg',),
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
                height: MediaQuery.of(context).size.height * 0.20,
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
                      Text(
                        "Kimler PCR Testi Yaptırmalı ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:Color(0xFF332d2b),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Hastalık şüphesi olan biriyle temasınız olduysa, Son zamanlarda kalabalık ortamlara girmek zorunda kaldıysanız, Covid-19 belirtilerinden birine sahipseniz, Yurtdışına gidecekseniz PCR testi yaptırmalısınız.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Kimler Antikor Test Yaptırmalı ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:Color(0xFF332d2b),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Farkında olmadan Covid-19 geçirdiğinizi düşünüyorsanız, Vücudunuzun SARS-CoV-2 virüsüne karşı direnç durumunu öğrenmek istiyorsanız, Covid-19 hastalığı geçirmişseniz antiko testi yaptırabilirsiniz.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20,),
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
