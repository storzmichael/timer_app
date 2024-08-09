import 'package:flutter/material.dart';

final ThemeData iosTheme = ThemeData(
  // Grundlegende Farben
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,

  // AppBar-Design
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.blue),
  ),

  // Schaltflächen-Design
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.blue,
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),
  ),

  // Icon-Design
  iconTheme: IconThemeData(
    color: Colors.blue,
  ),

  // Text-Design
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.normal,
    ),
  ),

  // Input Felder (TextField)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.blue),
    ),
    hintStyle: TextStyle(color: Colors.grey),
  ),

  // Karten-Design
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.grey.shade200,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
