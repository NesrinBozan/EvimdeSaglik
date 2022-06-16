import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/authentication/signup_screen.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/models/home_page_state.dart';
import 'package:users_app/screens/home_screen.dart';
import 'package:users_app/screens/splash_screen.dart';
import 'package:users_app/widgets/progress_dialog.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();

  validateForm(){
     if(!emailTextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "E-Posta geçerli değil.");
    }
    else if(passwordTextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "Şİfre boş bırakılamaz.");
    }
    else{
   loginUserNow();
    }

  }
  loginUserNow() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c){
          return ProgressDialog(message: "Bağlanıyor, Lütfen bekleyiniz...",);
        }
    );
    final User? firebaseUser= (
        await fAuth.signInWithEmailAndPassword(
            email: emailTextEditingController.text.trim() ,
            password: passwordTextEditingController.text.trim()
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error:" + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("users");
      driversRef.child(firebaseUser.uid).once().then((driverKey)
      {
        final snap = driverKey.snapshot;
        if(snap.value != null)
        {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Giriş Başarılı.");
          Navigator.push(context, MaterialPageRoute(builder: (c)=> HomePageState()));
   // Home_Page_Screen
        }
        else
        {
          Fluttertoast.showToast(msg: "Bu e-postayla ilgili kayıt yok.");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> MySplashScreen()));
        }
      });
    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Giriş Sırasında Hata Oluştu.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/user_app_logo.jpg"),
              ),
              const SizedBox(height: 10,),

              Text(
                "Kullanıcı Olarak Giriş Yapın",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 21,
                    color: Color(0xff8946A6),
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color:Color(0xff8946A6),
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide( color: Color(0xff8946A6)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide( color: Color(0xff8946A6)),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xff8946A6),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xff8946A6),
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Color(0xff8946A6)
                ),
                decoration: const InputDecoration(
                  labelText: "Şifre",
                  hintText: "Şifre",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide( color:Color(0xff8946A6)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide( color: Color(0xff8946A6)),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xff8946A6),
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xff8946A6),
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: ()
                  {
                  validateForm();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff8946A6),
                  ),
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));

                  },
                   child: const Text(
                "Bir hesabın yok mu? Buradan Üye Ol",
                style: TextStyle(
                  color: Color(0xff8946A6),
                ),
              ))
            ],
          ),
        ),

      ),
    );
  }
}
