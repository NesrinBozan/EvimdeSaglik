import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{
  static final Color textColor = const Color(0xFFccc7c5);
  static final Color mainColor = const Color(0xFF89dad0);
  //static final Color mainColor = const Color(0xFFfa7552);
  static final Color iconColor1 = const Color(0xFFffd28d);
  static final Color iconColor2 = const Color(0xFFfcab88);
  static final Color paraColor = const Color(0xFF8f837f);
  static final Color buttonBackgroundColor= const Color(0xFFf7f6f4);
  static final Color signColor = const Color(0xFFa9a29f);
  static final Color titleColor = const Color(0xFF5c524f);
  static final Color mainBlackColor = const Color(0xFF332d2b);
  //static final Color yellowColor = const Color(0xFFfa7552);
  static final Color yellowColor = const Color(0xFFffd379);

}
const mainBgColor =Color(0xfff2f2f2);
const darkColor =Color(0xff8946A6);
const colors1 =Color(0xffB762C1);
const color2 = Color(0xffc5b9cd);
const color3 = Color(0xffEA99D5);
const color4 =Color(0xffFFCDDD);
const searchBackroundColor=Color(0xffF2F2F2);
const kBackgroundColor =Color(0xffF9F9F9);

const purpleGradient= LinearGradient(
    colors:<Color>[darkColor,colors1,color2],
    stops: [0.0,0.5,1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
);

const pinkGradient =LinearGradient(
    colors: <Color>[color3,color4],
  stops: [0.0,1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
