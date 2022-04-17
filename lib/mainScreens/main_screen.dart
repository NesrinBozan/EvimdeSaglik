
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/mainScreens/search_places_screen.dart';
import 'package:users_app/widgets/my_drawer.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

   GlobalKey<ScaffoldState> skey =GlobalKey<ScaffoldState>();
   double searchLocationContainerHeight=220;

   Position?  userCurrentPosition;
   var geoLocator= Geolocator();

   LocationPermission? _locationPermission;
   double bottomPaddingOfMap =0;



  blackThemeGoogleMap()
  {
    newGoogleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');

  }

  checkIfLocationPermissionAllowed() async{
    _locationPermission = await  Geolocator.requestPermission();

    if(_locationPermission == LocationPermission.denied){
      _locationPermission = await Geolocator.requestPermission();
    }
  }
  locateUserPosition()async{
  Position cPosition =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  userCurrentPosition = cPosition;

  LatLng latLngPosition = LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);

  CameraPosition cameraPosition = CameraPosition( target: latLngPosition,zoom: 14);

  newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

  String humanReadableAddress  = await AssistantMethods.searchAddressForGeographicCoOrdinates(userCurrentPosition!,context);

  print("this is your address" + humanReadableAddress);
  }
  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        name: userModelCurrentInfo!.name,
        email: userModelCurrentInfo!.email,
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition:_kGooglePlex,
            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap .complete(controller);
               newGoogleMapController= controller;

               blackThemeGoogleMap();

               setState(() {
                 bottomPaddingOfMap =240;
               });
               locateUserPosition();
            },

          ),

          //ui for searching location
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 120),
              child: Container(
                height:searchLocationContainerHeight ,
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),

                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 18),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start, // Tasarımda sıkıntı varsa sonradan ilave edildi kontrol et
                        children:  [
                      const Icon(Icons.add_location_outlined,color:Color(0xff8946A6),),
                       const   SizedBox(width: 12.0,),
                       Text(
                           Provider.of<AppInfo>(context).userPickUpLocation !=null
                               ? (Provider.of<AppInfo>(context).userPickUpLocation!.locationName!).substring(0,24) + "..."
                               : "Kendi Konumun",
                            style: TextStyle(color: Colors.deepPurple,fontSize: 12),

                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0,),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.deepPurpleAccent,
                      ),
                      const SizedBox(height: 16.0,),
                      GestureDetector(
                        onTap: ()
                        {
                          //search pleach
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchPlacesScreen()));

                        },

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Icon(Icons.add_location_outlined,color: Color(0xff8946A6),),
                            const   SizedBox(width: 12.0,),
                            Text(
                              Provider.of<AppInfo>(context).userPickUpLocation !=null
                                  ? (Provider.of<AppInfo>(context).userPickUpLocation!.locationName!).substring(0,24) + "..."
                                  : "En yakın ... / Gönder",
                              style: TextStyle(color: Colors.deepPurple,fontSize: 12),

                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16.0,),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.deepPurpleAccent,
                      ),
                      const SizedBox(height: 16.0,),

                      ElevatedButton(
                          onPressed: (){

                          },
                          child: Text("Sağlık Hizmetini Çağır"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff8946A6),
                        textStyle: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
