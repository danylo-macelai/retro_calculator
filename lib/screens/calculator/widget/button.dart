import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:retro_calculator/utils/constant.dart';

class Button extends StatelessWidget {
  final String value;
  final Color fontColor;
  final String fontFamily;
  final List<Color> colors;

  Button.gray({
    @required this.value,
    this.fontColor = const Color(0XFF707070),
    this.fontFamily = 'AdelleSans',
    this.colors = const [
      Color(0XFFFFFFFF),
      Color(0XFFCFCFCF),
    ],
  });

  Button.green({
    @required this.value,
    this.fontColor = const Color(0XFFFFFFFF),
    this.fontFamily = 'AdelleSans',
    this.colors = const [
      Color(0XFFDB656E),
      Color(0XFFD92534),
    ],
  });

  Button.red({
    @required this.value,
    this.fontColor = const Color(0XFFFFFFFF),
    this.fontFamily = 'Raleway',
    this.colors = const [
      Color(0XFF84BF9E),
      Color(0XFF48AE75),
    ],
  });

  @override
  Widget build(BuildContext context) {
    double size = 70.0;
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 7.5, left: 0.75),
            width: size + 10.0,
            height: size + 10.0,
            decoration: const ShapeDecoration(
              color: Color(0X80707070),
              shape: CircleBorder(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 6.0),
            width: size + 12.0,
            height: size + 12.0,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              gradient: mGradient(
                Alignment.topCenter,
                Alignment.bottomCenter,
                stops: [0.1, 1.0],
                colors: colors,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(6.0),
            width: size,
            height: size,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              gradient: mGradient(
                Alignment.bottomCenter,
                Alignment.topCenter,
                stops: [0.1, 1.0],
                colors: colors,
              ),
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
