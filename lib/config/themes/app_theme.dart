import 'package:flutter/material.dart';

ThemeData appTheme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme()
  );

}

AppBarTheme appBarTheme(){
  return const  AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xff8b8b8b)), 
    titleTextStyle: TextStyle(fontSize: 18, color: Color(0xff8b8b8b))
  );
}