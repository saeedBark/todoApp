import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  //app bar theme
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  primaryColor: Colors.blue.shade900,

  iconTheme:  IconThemeData(color: Colors.blue.shade900,),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue.shade900,
  ),
  textTheme:  TextTheme(
    bodyText1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(5),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff333739),
  //app bar theme
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xff333739),
        statusBarBrightness: Brightness.light),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  primaryColor: Colors.blue.shade900,
  iconTheme:  IconThemeData(color:Colors.blue.shade900,),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue.shade900,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  ),
  cardTheme: CardTheme(
    color: Color(0xff333739),
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(5),
    ),
  ),
);
