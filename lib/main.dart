import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:retro_calculator/screens/calculator_screen.dart';
import 'package:retro_calculator/utils/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retro Calculator',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        primaryColor: mPrimaryColor,
        accentColor: mAccentColor,
        scaffoldBackgroundColor: mBackgroundColor,
        fontFamily: 'AdelleSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                fontSize: 32.0,
                color: Color(0XFF707070),
                fontWeight: FontWeight.w400,
              ),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: Colors.transparent,
              brightness: Brightness.light,
              elevation: 0,
            ),
      ),
      home: CalculatorScreen(),
    );
  }
}
