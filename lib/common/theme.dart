import 'package:elections/utils/Colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Couleurs().primary,
  primaryColorDark: Couleurs().primary.shade500,
  primaryColorLight: Couleurs().primary,
  //colorSchemeSeed: Colors.yellow,
  appBarTheme: AppBarTheme(
    backgroundColor: Couleurs().primary,
    foregroundColor: Colors.black,
    elevation: 20,
  ),
  textTheme:  TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w300,
      fontSize: 10,
      color: Colors.black,
    ),
  ),
);
