import 'package:flutter/material.dart';
import 'package:retro_calculator/screens/calculator/widget/keyboard.dart';

import 'widget/display.dart';
import '../../utils/constant.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 16.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: mGradient(
              Alignment.topRight,
              Alignment.bottomLeft,
              colors: [
                mBackgroundColor,
                mPrimaryColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Display('0'),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
