
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/assistants/geofire_assistant.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/main.dart';
import 'package:users_app/mainScreens/rate_driver_screen.dart';
import 'package:users_app/mainScreens/search_places_screen.dart';
import 'package:users_app/mainScreens/select_nearest_active_driver_screen.dart';
import 'package:users_app/models/active_nearby_available_drivers.dart';
import 'package:users_app/widgets/end_of_ride_dialog.dart';
import 'package:users_app/widgets/my_drawer.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> skey = GlobalKey<ScaffoldState>();
  double searchLocationContainerHeight = 220;
  double waitingResponseFromDriverContainerHeight =0;
  double assignedDriverInfoContainerHeight=0;

  Position? userCurrentPosition;
  var geoLocator = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingOfMap = 0;

  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};

  bool openNavigationDrawer = true;
  bool activeNearbyDriverKeysLoaded = false;
  BitmapDescriptor? activeNearbyIcon;

  List<ActiveNearbyAvailableDrivers> onlineNearByAvailableDriversList = [];

  DatabaseReference? referenceRideRequest;
  String driverRideStatus = "Sağlık Hizmeti Geliyor";

  StreamSubscription<DatabaseEvent>? tripRideRequestInfoStreamSubscription;

  String userRideRequestStatus = "";
  bool requestPositionInfo = true;


  blackThemeGoogleMap() {
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

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(
        userCurrentPosition!.latitude, userCurrentPosition!.longitude);

    CameraPosition cameraPosition = CameraPosition(
        target: latLngPosition, zoom: 14);

    newGoogleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAddress = await AssistantMethods
        .searchAddressForGeographicCoOrdinates(userCurrentPosition!, context);

    print("this is your address" + humanReadableAddress);
    initializeGeoFireListener();
  }

  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
  }

  saveRideRequestInformation() {
    // save the RideRequest Informaion

    referenceRideRequest = FirebaseDatabase.instance.ref().child("All Ride Request").push();

    var originLocation = Provider.of<AppInfo>(context , listen: false).userPickUpLocation;

    Map originLocationMap =
    {
      "latitude": originLocation!.locationLatitude.toString(),
      "longitude": originLocation!.locationLongitude.toString(),
    };

    Map userInformationMap =
    {
      "origin": originLocationMap,
      "time": DateTime.now().toString(),
      "userName":userModelCurrentInfo!.name,
      "userPhone": userModelCurrentInfo!.phone,
      "originAddress": originLocation.locationName,
      "driverId":"waiting",
    };

    referenceRideRequest!.set(userInformationMap);

   tripRideRequestInfoStreamSubscription = referenceRideRequest!.onValue.listen((eventSnap)
    {
      if(eventSnap.snapshot.value == null)
      {
        return;
      }
      if((eventSnap.snapshot.value as Map)["car_details"] != null)
        {
        setState(() {
          driverCarDetails = (eventSnap.snapshot.value as Map)["car_details"].toString();
        });

        }
      if((eventSnap.snapshot.value as Map)["driverPhone"] != null)
      {
        setState(() {
          driverPhone = (eventSnap.snapshot.value as Map)["driverPhone"].toString();
        });

      }
      if((eventSnap.snapshot.value as Map)["driverName"] != null)
      {
        setState(() {
          driverName = (eventSnap.snapshot.value as Map)["driverName"].toString();
        });

      }

      if((eventSnap.snapshot.value as Map )["status"] != null)
        {
          userRideRequestStatus = (eventSnap.snapshot.value as Map)["status"].toString();
        }

      if((eventSnap.snapshot.value as Map)["driverLocation"] != null)
        {
          double driverCurrentPositionLat = double.parse((eventSnap.snapshot.value as Map)["driverLocation"]["latitude"].toString());
          double driverCurrentPositionLng = double.parse((eventSnap.snapshot.value as Map)["driverLocation"]["longitude"].toString());

          LatLng driverCurrentPositionLatLng = LatLng(driverCurrentPositionLat,driverCurrentPositionLng);


          if(userRideRequestStatus == "ended")
            {
              var response = showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext c) => EndOfRideDialog(),

              );

              if(response =="Degerlendir")
                {
                  if((eventSnap.snapshot.value as Map)["driverId"] != null)
                    {
                      String assignedDriverId = (eventSnap.snapshot.value as Map)["driverId"].toString();

                      Navigator.push(context, MaterialPageRoute(builder: (c)=> RateDriverScreen(
                        assignedDriverId : assignedDriverId,
                      )));

                      referenceRideRequest!.onDisconnect();
                    }
                }
            }

        }


    });



    onlineNearByAvailableDriversList = GeoFireAssistant.activeNearbyAvailableDriversList;
    searchNearestOnlineDrivers();
  }



  searchNearestOnlineDrivers() async {

    // no active driver available

    if(onlineNearByAvailableDriversList.length == 0)
      {
        //cansel/delete  the RideRequest Information

        referenceRideRequest!.remove();

        setState(() {
          markersSet.clear();
          circlesSet.clear();

        });

        Fluttertoast.showToast(msg: "Yakında çevrimiçi sürücü yok.");

        Future.delayed(const Duration(milliseconds: 4000),()
        {
          SystemNavigator.pop();
        });

        return;
      }

    // active driver available
    await retrieveOnlineDriversInformation(onlineNearByAvailableDriversList);

    var response = await Navigator.push(context, MaterialPageRoute(builder: (c)=> SelectNearestActiveDriverScreen(referenceRideRequest: referenceRideRequest)));
    if(response == "driverChoosed")
      {
        FirebaseDatabase.instance.ref().child("drivers")
            .child(choosenDriverId!).once()
            .then((snap)
        {
          if(snap.snapshot.value !=null)
            {
              sendNotificationToDriverNow(choosenDriverId!);

             // display waiting response uı
              showWaitingResponseFromDriverUI();

              FirebaseDatabase.instance.ref().child("drivers")
                  .child(choosenDriverId!)
                  .child("newRideStatus")
                  .onValue.listen((eventSnapshot)
              {
                // 1. driver can cansel the rideRequest : push notification
                if(eventSnapshot.snapshot.value == "idle")
                  {
                    Fluttertoast.showToast(msg: "Sağlık hizmeti çağrınızı iptal etti. Lütfen farklı bir seçim yapınız.");
                    Future.delayed(const Duration(milliseconds: 3000), ()
                    {
                      Fluttertoast.showToast(msg: "Lütfen uygulamayı yeniden başlatınız.");

                      SystemNavigator.pop();
                    });
                  }

                // 2. accept the rideRequest : push notification
                if(eventSnapshot.snapshot.value == "accepted")
                {
                 showUIForAssignedDriverInfo();


                }

              });



            }
          else
            {
              Fluttertoast.showToast(msg: "Sağlık Aracı yok . Tekrar deneyin.");
            }
        });

      }

  }


  showUIForAssignedDriverInfo()
  {
    setState(() {
      searchLocationContainerHeight = 0;
      waitingResponseFromDriverContainerHeight = 0;
      assignedDriverInfoContainerHeight = 240;
    });

  }

  showWaitingResponseFromDriverUI()
  {
    setState(() {
      searchLocationContainerHeight =0;
      waitingResponseFromDriverContainerHeight= 220;
    });
  }

  sendNotificationToDriverNow (String choosenDriverId)
  {
    FirebaseDatabase.instance.ref()
        .child("drivers")
        .child(choosenDriverId)
        .child("newRideRequest")
        .set(referenceRideRequest!.key);

    //automate the push notification service
    FirebaseDatabase.instance.ref()
        .child("drivers")
        .child(choosenDriverId)
        .child("token")
        .once().then((snap)
    {
     if(snap.snapshot.value != null)
       {
         String deviceRegistrationToken = snap.snapshot.value.toString();
         AssistantMethods.sendNotificationToDriverNow(
           deviceRegistrationToken,
           referenceRideRequest!.key.toString(),
           context,
         );
         Fluttertoast.showToast(msg: "Bildirim başarıyla gönderildi.");
       }
     else
       {
        Fluttertoast.showToast(msg: "Lütfen bir hizmet türü seçin.");
        return;
       }


    });

  }

  retrieveOnlineDriversInformation(List onlineNearestDriversList)async
  {
   DatabaseReference ref = FirebaseDatabase.instance.ref().child("drivers");
   for (int i =0; i<onlineNearestDriversList.length; i++)
     {
       await ref.child(onlineNearestDriversList[i].driverId.toString())
           .once()
           .then((dataSnapshot)
           {
             var driverKeyInfo = dataSnapshot.snapshot.value;
             dList.add(driverKeyInfo);
             print("driver keyInformation =" +dList.toString());
           });
     }
  }

  @override
  Widget build(BuildContext context) {
    createActiveNearbydriverIconMarker();
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
            initialCameraPosition: _kGooglePlex,
            markers: markersSet,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              blackThemeGoogleMap();

              setState(() {
                bottomPaddingOfMap = 240;
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
                height: searchLocationContainerHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),

                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 18),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Tasarımda sıkıntı varsa sonradan ilave edildi kontrol et
                        children: [
                          const Icon(Icons.add_location_outlined, color: Color(
                              0xff8946A6),),
                          const SizedBox(width: 12.0,),
                          Text(
                            Provider
                                .of<AppInfo>(context)
                                .userPickUpLocation != null
                                ? (Provider
                                .of<AppInfo>(context)
                                .userPickUpLocation!
                                .locationName!).substring(0, 24) + "..."
                                : "Kendi Konumun",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 12),

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
                        onTap: () {
                          //search pleach
                          var responseFromSearchScreen = Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (c) => SearchPlacesScreen()));

                          if (responseFromSearchScreen == "obtainedDropOff") {

                          }
                        },

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.add_location_outlined,
                              color: Color(0xff8946A6),),
                            const SizedBox(width: 12.0,),
                            Text(
                              Provider
                                  .of<AppInfo>(context)
                                  .userDropOffLocation != null
                                  ? (Provider
                                  .of<AppInfo>(context)
                                  .userDropOffLocation!
                                  .locationName!).substring(0, 24) + "..."
                                  : "Bu Adrese Gönder",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 12),

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
                        onPressed: () {
                          saveRideRequestInformation();
                        },
                        child: Text("Sağlık Hizmetini Çağır"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff8946A6),
                          textStyle: const TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

          //ui for waiting response from driver
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:Container(
                height: waitingResponseFromDriverContainerHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),

                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: AnimatedTextKit(
                        animatedTexts:[
                          FadeAnimatedText(
                            "Sağlık Kurumundan Cevabı Bekleyiniz",
                            duration: const Duration(seconds: 5),
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(fontSize: 30.0,color: Colors.black26, fontWeight: FontWeight.bold),
                          ),
                          ScaleAnimatedText(
                            "Lütfen Bekleyiniz..",
                              textAlign: TextAlign.center,
                              duration: const Duration(seconds: 10),
                            textStyle:const TextStyle(fontSize:32.0,color: Colors.black26,fontFamily: '')

                          )

                        ] ),
                  ),
                ),
              ) ),

          //ui for displaying assigned from information
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              height: assignedDriverInfoContainerHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),

                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        driverRideStatus,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0,),

                     const Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),

                    const SizedBox(height: 20.0,),

                    // driver vehicle details
                    Text(

                      driverCarDetails,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 4.0,),

                    Text(
                      driverName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 20.0,),

                    const Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),

                    const SizedBox(height: 20.0,),
                    // call driver button
                    Center(
                      child: ElevatedButton.icon(
                          onPressed:() {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          icon: const Icon(
                            Icons.phone_android,
                            color: Colors.black54,
                            size: 22,
                          ),
                          label: const Text(
                              "Ara",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                          ),)),
                    )

                  ],
                ),
              ),

            ),),
        ],
      ),
    );
  }

  initializeGeoFireListener() {
    Geofire.initialize("activeDrivers");

    Geofire.queryAtLocation(
        userCurrentPosition!.latitude, userCurrentPosition!.longitude, 10)!
        .listen((map) {
      print(map);
      if (map != null) {
        var callBack = map['callBack'];


        switch (callBack) {
        //whenever any driver become active/online
          case Geofire.onKeyEntered:
            ActiveNearbyAvailableDrivers activeNearbyAvailableDriver = ActiveNearbyAvailableDrivers();
            activeNearbyAvailableDriver.locationLatitude = map['latitude'];
            activeNearbyAvailableDriver.locationLongitude = map['longitude'];
            activeNearbyAvailableDriver.driverId = map['key'];
            GeoFireAssistant.activeNearbyAvailableDriversList.add(
                activeNearbyAvailableDriver);
            if (activeNearbyDriverKeysLoaded == true) {
              displayActiveDriversOnUserMap();
            }
            break;

        //whenever any driver become non-active/online
          case Geofire.onKeyExited:
            GeoFireAssistant.deleteOfflineDriverFromList(map['key']);
            displayActiveDriversOnUserMap();
            break;
        // whenever driver moves-update driver location
          case Geofire.onKeyMoved:
            ActiveNearbyAvailableDrivers activeNearbyAvailableDriver = ActiveNearbyAvailableDrivers();
            activeNearbyAvailableDriver.locationLatitude = map['latitude'];
            activeNearbyAvailableDriver.locationLongitude = map['longitude'];
            activeNearbyAvailableDriver.driverId = map['key'];
            GeoFireAssistant.updateActiveNearbyAvailableDriverLocation(
                activeNearbyAvailableDriver);
            displayActiveDriversOnUserMap();
            break;

        //display thosde online / active drivers on user's map
          case Geofire.onGeoQueryReady:
            activeNearbyDriverKeysLoaded = true;
            displayActiveDriversOnUserMap();
            break;
        }
      }
      setState(() {});
    });
  }

  displayActiveDriversOnUserMap() {
    setState(() {
      markersSet.clear();
      circlesSet.clear();

      Set<Marker> driverMarkerSet = Set<Marker>();

      for (ActiveNearbyAvailableDrivers eachDriver in GeoFireAssistant
          .activeNearbyAvailableDriversList) {
        LatLng eachDriverActivePosition = LatLng(
            eachDriver.locationLatitude!, eachDriver.locationLongitude!);

        Marker marker = Marker(
          markerId: MarkerId("driver" + eachDriver.driverId!),
          position: eachDriverActivePosition,
          icon: activeNearbyIcon!,
          rotation: 360,
        );
        driverMarkerSet.add(marker);
      }

      setState(() {
        markersSet = driverMarkerSet;
      });
    });
  }

  createActiveNearbydriverIconMarker() {

   if(activeNearbyIcon == null)
     {

       ImageConfiguration imageConfiguration = createLocalImageConfiguration(
           context, size: const Size(2, 2));
       BitmapDescriptor.fromAssetImage(imageConfiguration, "images/marker.png")
           .then((value) {
         activeNearbyIcon = value;
       });
     }
  }




}