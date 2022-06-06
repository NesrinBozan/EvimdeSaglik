import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/assistants/request_assistant.dart';
import 'package:users_app/global/map_key.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/models/directions.dart';
import 'package:users_app/models/predicted_places.dart';
import 'package:users_app/widgets/progress_dialog.dart';

class PlacePredictionTileDesign extends StatefulWidget {

  final PredictedPlaces? predictedPlaces;

  PlacePredictionTileDesign({this.predictedPlaces});

  @override
  State<PlacePredictionTileDesign> createState() => _PlacePredictionTileDesignState();
}

class _PlacePredictionTileDesignState extends State<PlacePredictionTileDesign> {
  getPlaceDirectionDetails(String? placeId, context) async{

    showDialog(
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        message: "İşlem ayarlanıyor, Lütfen bekleyiniz...",
      )
    );

    String placeDirectionDetails = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";

    var responseApi= await RequestAssistant.receiveRequest(placeDirectionDetails);

    Navigator.pop(context);

    if(responseApi == "Hata oluştu, Başarısız.Cevap yok.")
    {
    return;
  }
  if(responseApi["status"] == "OK") {
    Directions directions = Directions();
    directions.locationName = responseApi["result"]["name"];
    directions.locationId = placeId;
    directions.locationLatitude = responseApi["result"]["geometry"]["location"]["lat"];
    directions.locationLongitude = responseApi["result"]["geometry"]["location"]["lng"];

    Provider.of<AppInfo>(context, listen:false).updateDropOffLocationAddress(directions);


    Navigator.pop(context,"obtainedDropOff");


  }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()
      {
      getPlaceDirectionDetails(widget.predictedPlaces!.place_id,context);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xffd7c5ed),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const Icon(
              Icons.add_location,
              color: Color(0xffac9dbd),

            ),
            const SizedBox(width: 14.0,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0,),
                    Text(
                      widget.predictedPlaces!.main_text!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,

                      ),
                    ),
                    const SizedBox(height: 2.0,),
                    Text(
                      widget.predictedPlaces!.secondary_text!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,

                      ),
                    ),
                    const SizedBox(height: 8.0,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
