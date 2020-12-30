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
          padding: EdgeInsets.all(12.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mBackgroundColor,
                mPrimaryColor,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            children: [
              Display('0'),
              SizedBox(height: 26.0),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
