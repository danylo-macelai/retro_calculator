import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:retro_calculator/utils/constant.dart';

class Display extends StatelessWidget {
  final String answer;

  Display(this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 220.0,
      decoration: BoxDecoration(
        gradient: mGradient(
          Alignment.topLeft,
          Alignment.bottomCenter,
          stops: [0.4, 1.0],
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: mGradient(
            Alignment.bottomCenter,
            Alignment.topCenter,
            stops: [0.1, 1.0],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          color: Color(0XFF520000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _autoSizeText(answer, minFontSize: 20, maxFontSize: 64),
            ],
          ),
        ),
      ),
    );
  }

  AutoSizeText _autoSizeText(
    String value, {
    double minFontSize: 14,
    double maxFontSize: 26,
  }) {
    return AutoSizeText(
      value,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: 1,
      textAlign: TextAlign.end,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
        fontSize: maxFontSize,
        color: Color(0XFFFFFFFF),
      ),
    );
  }
}
