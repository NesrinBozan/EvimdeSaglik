// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {

  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorProfession;

  DoctorCard({required this.doctorImagePath,required this.rating,required this.doctorName,required this.doctorProfession});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:  Color(0xffc5b9cd),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                doctorImagePath,
                height: 100,),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star,
                  color: Colors.limeAccent,),
                Text(rating,
                  style: TextStyle(fontWeight: FontWeight.bold),),

              ],
            ),
            const SizedBox(height: 10,),

              Text(
              doctorName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            Text(doctorProfession + '7.yıl'),
          ],
        ),
      ),
    );

  }
}
