import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/models/home_page_state.dart';
import 'package:users_app/screens/covid19_detail.dart';
import 'package:users_app/screens/detail_screen.dart';
import 'package:users_app/screens/nurse_detail.dart';
import 'package:users_app/screens/profile_screen.dart';
import 'package:users_app/screens/splash_screen.dart';
import 'package:users_app/screens/checkUp_detail.dart';
import 'package:users_app/screens/branch_screen.dart';
import 'package:users_app/widgets/end_of_ride_dialog.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp(
         child: ChangeNotifierProvider(
           create: (context) =>AppInfo(),
           child: MaterialApp(
             title: 'User App',
             theme: ThemeData(

               primarySwatch: Colors.blue,
             ),
             home:
             //MainScreen(),
             //LoginScreen(),
               MySplashScreen(), //
           // HomePageState(),
            // DetailScreen(),

             debugShowCheckedModeBanner: false,
           ),
         )
      ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;
  MyApp({this.child});

  static void restartApp(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key =UniqueKey();
  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        key: key,
        child: widget.child!,
    );
  }
}


