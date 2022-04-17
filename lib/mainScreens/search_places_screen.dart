
import 'package:flutter/material.dart';
import 'package:users_app/assistants/request_assistant.dart';
import 'package:users_app/models/predicted_places.dart';
import 'package:users_app/widgets/place_prediction_tile.dart';

import '../global/map_key.dart';

class SearchPlacesScreen extends StatefulWidget {

  @override
  _SearchPlacesScreenState createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  List<PredictedPlaces> placesPredictedList =[];

  void findPlaceAutoCompleteSearch(String inputText) async
  {
  if (inputText.length >1) //2 or more than input characters
    {
      String urlAutoCompleteSearch ="https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:TR";

        var responseAutoCompleteSearch = await RequestAssistant.receiveRequest(urlAutoCompleteSearch);

        if(responseAutoCompleteSearch == "Error Occurred, Failed. No Response")
        {
          return;
        }
        if(responseAutoCompleteSearch["status"] == "OK")
          {
           var placePredictions =  responseAutoCompleteSearch["predictions"];
           var placePredictionsList = (placePredictions as List).map((jsonData)=> PredictedPlaces.fromJsaon(jsonData)).toList();
           setState(() {
             placesPredictedList =placePredictionsList;
           });

          }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // search place ui
          Container(
            height: 160,
            decoration:const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color:Color(0xff8946A6),
                  blurRadius: 8,
                  spreadRadius: 0.5,
                  offset:
                    Offset(
                      0.7,
                      0.7,
                    ),

                ),
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 25.0,),

                  Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                       Navigator.pop(context);
                      },
                    child:
                    const Icon(
                      Icons.arrow_back,
                      color: Color(0xffac9dbd),
                    ),
                    ),
                  const  Center(
                      child: Text(
                        "Konum Araması Yap",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff81768e),
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                    )
                  ],
                ),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      const Icon(
                        Icons.adjust_sharp,
                        color: Color(0xffac9dbd),
                      ),
                      const SizedBox(height: 18.0,),

                      Expanded(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (valueTyped){
                             findPlaceAutoCompleteSearch(valueTyped);
                            },
                            decoration: const InputDecoration(
                              hintText: "arama...",
                              fillColor: Color(0xffd7c5ed),
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 11.0,
                                top: 8.0,
                              bottom: 8.0,
                              ),

                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],

              ),
            ),
          ),

          //display place predictions result
          (placesPredictedList.length >0)
              ? Expanded (
            child: ListView.separated(
              itemCount: placesPredictedList.length,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index)
              {
                return PlacePredictionTileDesign(
                  predictedPlaces: placesPredictedList[index],
                );
              },

              separatorBuilder: (BuildContext context, int index)
              {
               return const Divider(
                  height: 1,
                  color: Color(0xff8946A6),
                  thickness: 1,
                );
              },

            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
