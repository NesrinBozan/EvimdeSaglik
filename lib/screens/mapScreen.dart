import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:users_app/mainScreens/main_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text("Evimde Sağlık"),
        titleSpacing: 00.0,
          centerTitle:true,
        toolbarHeight: 60.2 ,
        toolbarOpacity: 0.8,
          shape:  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),

            ),
          ),
        elevation:0.00,
        backgroundColor: Colors.deepPurple[400],
      ),

      body:  Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.network('https://assets8.lottiefiles.com/packages/lf20_sy2feyup.json',
                width: 170,height: 170,
                fit: BoxFit.fill),
            SizedBox(height: 10,),
          Text(
          "Siz hastaneye gitmeyin, tek tıkla doktorunuz size gelsin !",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color:Color(0xFF332d2b),
          ),
        ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all( Colors.deepPurple[100]),
              ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                }, child: Text("Şimdi Çağır",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),),
            )

    ],),
      ),

    );
  }
}
