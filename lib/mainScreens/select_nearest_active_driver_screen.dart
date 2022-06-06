// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:users_app/global/global.dart';

class SelectNearestActiveDriverScreen extends StatefulWidget {


  DatabaseReference? referenceRideRequest;

  SelectNearestActiveDriverScreen({this.referenceRideRequest});

  @override
  _SelectNearestActiveDriverScreenState createState() => _SelectNearestActiveDriverScreenState();
}

  class _SelectNearestActiveDriverScreenState extends State<SelectNearestActiveDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        title: Text(
            "En Yakın Çevrimiçi Sürücü",
          style: TextStyle(
          fontSize: 18,
        ),),
        leading: IconButton(
            onPressed: ()
          {


            widget.referenceRideRequest!.remove();
            Fluttertoast.showToast(msg: "Hizmet isteğini iptal ettin.");
            SystemNavigator.pop();
          },
            icon: const Icon(Icons.close,color: Colors.white,),
        ),
      ),
      body: ListView.builder(
        itemCount: dList.length,
         itemBuilder: (BuildContext context, int index)
        {
          return GestureDetector(
           onTap: ()
           {
           setState(() {
             choosenDriverId =  dList[index]["id"].toString();
           });

           Navigator.pop(context,"driverChoosed");
           },
            child: Card(
              color: Colors.grey,
              elevation: 3,
              shadowColor: Colors.amberAccent,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Padding(padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                    "images/" + dList[index]["car_details"]["type"].toString() + "ml_prescription2.png" + "ml_prescription3.png" + "ml_prescription4.png",
                width: 70,
                ),
                ) ,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dList[index]["name"],
                      style:  const TextStyle(
                        fontSize: 14,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      dList[index]["car_details"]["car_model"],
                      style:  const TextStyle(
                          fontSize: 14,
                          color: Colors.black
                      ),
                    ),

                    SmoothStarRating(
                      rating:dList[index]["ratings"] == null ? 0.0 : double.parse(dList[index]["ratings"]),
                      color: Colors.amberAccent,
                      allowHalfRating: true,
                      starCount: 5,
                      size: 15,
                    )
                  ],
                ),

                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2,)
                  ],
                ),
              ),
            ),
          );
        },),
    );
  }
}
