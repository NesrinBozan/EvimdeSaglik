import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:users_app/global/global.dart';

class RateDriverScreen extends StatefulWidget {

  String assignedDriverId;
  RateDriverScreen({required this.assignedDriverId});

  @override
  _RateDriverScreenState createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[50],
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
        child: Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [

              const SizedBox(height: 22.0,),

            const Text(
                  " Puan Ver",
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.black26,
              ),),
              const SizedBox(height: 22.0,),

              const Divider(height: 4.0, thickness: 4.0,),

              const SizedBox(height: 22.0,),

              SmoothStarRating(
                rating: countRatingStarts,
                allowHalfRating: false,
                starCount: 5,
                color: Colors.limeAccent,
                borderColor: Colors.limeAccent,
                size: 46,
                onRatingChanged: (valueOfStarsChoosed)
              {
              countRatingStarts = valueOfStarsChoosed;

              if(countRatingStarts ==1)
              {
                setState(() {
                 titleStarsRating = "Çok Kötü";
            });
              }
              if(countRatingStarts ==2)
              {
                setState(() {
                  titleStarsRating = "Kötü";
                });
              }
              if(countRatingStarts ==3)
              {
                setState(() {
                  titleStarsRating = "İyi";
                });
              }
              if(countRatingStarts ==4)
              {
                setState(() {
                  titleStarsRating = "Çok İyi";
                });
              }
              if(countRatingStarts ==5)
              {
                setState(() {
                  titleStarsRating = "Harika";
                });
              }
              }
              ),

              const SizedBox(height: 12.0,),

              Text(
                titleStarsRating,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),

              const SizedBox(height: 18.0,),

              ElevatedButton(
                  onPressed: ()
                  {
                    DatabaseReference rateDriverRef = FirebaseDatabase
                        .instance
                        .ref()
                        .child("drivers")
                        .child(widget.assignedDriverId!)
                        .child("ratings");

                    rateDriverRef.once().then((snap)
                    {
                    if(snap.snapshot.value == null)
                      {
                        rateDriverRef.set(countRatingStarts.toString());
                        SystemNavigator.pop();
                      }
                    else
                      {
                       double pastRatings = double.parse(snap.snapshot.value.toString());
                       double newAverageRatings = (pastRatings + countRatingStarts) / 2;
                       rateDriverRef.set(newAverageRatings.toString());
                       SystemNavigator.pop();
                      }

                    Fluttertoast.showToast(msg: "Lütfen Uygulamayı Tekrar Başlatın.");
                    });

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 74),
                  ),
                  child: const Text(
                    "Gönder",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ) ,)),

              const SizedBox(height: 10.0,),

            ],
          ),
        ),
      ),
    );
  }
}
