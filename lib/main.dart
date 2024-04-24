import 'package:elections/pages/Login/LoginPage.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: ThemeData(
        primaryColor: Couleurs().primary,
        primaryColorDark: Couleurs().primary.shade500,
        primaryColorLight: Couleurs().primary,
        appBarTheme: AppBarTheme(
          backgroundColor: Couleurs().primary ,
          foregroundColor: Colors.black,
          elevation: 20,
        ),
      ),
    );
  }
}
