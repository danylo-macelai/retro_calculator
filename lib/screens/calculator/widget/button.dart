import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:retro_calculator/models/calculator.dart';
import 'package:retro_calculator/utils/constant.dart';

class Button extends StatelessWidget {
  final Command command;
  final Color fontColor;
  final String fontFamily;
  final bool larger;
  final List<Color> colors;
  final double top;
  final double fontSize;
  final void Function(Command) onTap;

  Button.gray({
    @required this.command,
    @required this.onTap,
    this.fontColor = const Color(0X99707070),
    this.fontFamily = 'AdelleSans',
    this.larger = false,
    this.colors = const [
      Color(0XFFFFFFFF),
      Color(0XFFCFCFCF),
    ],
    this.top = 10.0,
    this.fontSize: 36.0,
  });

  Button.green({
    @required this.command,
    @required this.onTap,
    this.fontColor = const Color(0XCCFFFFFF),
    this.fontFamily = 'AdelleSans',
    this.larger = false,
    this.colors = const [
      Color(0XFF84BF9E),
      Color(0XFF48AE75),
    ],
    this.top = 8.0,
    this.fontSize: 48.0,
  });

  Button.red({
    @required this.command,
    @required this.onTap,
    this.fontColor = const Color(0XCCFFFFFF),
    this.fontFamily = 'Raleway',
    this.larger = false,
    this.colors = const [
      Color(0XFFDB656E),
      Color(0XFFD92534),
    ],
    this.top = 0.0,
    this.fontSize: 36.0, String value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: larger ? 2 : 1,
      child: InkWell(
        onTap: () {
          onTap(command);
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.5, left: 0.75),
              width: _width(75.0),
              height: 75.0,
              decoration: ShapeDecoration(
                color: Color(0X80707070),
                shape: _shape,
              ),
            ),
            Container(
              width: _width(76.0),
              height: 76.0,
              decoration: ShapeDecoration(
                shape: _shape,
                gradient: mGradient(
                  Alignment.topCenter,
                  Alignment.bottomCenter,
                  stops: [0.1, 1.0],
                  colors: colors,
                ),
              ),
            ),
            Container(
              width: _width(66, expanded: 28.0),
              height: 66,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: _shape,
                gradient: mGradient(
                  Alignment.bottomCenter,
                  Alignment.topCenter,
                  stops: [0.1, 1.0],
                  colors: colors,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: top),
                child: _text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _text {
    TextStyle style = TextStyle(
      color: fontColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    );

    return Command.plus_minus == command
        ? Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 8.0,
                bottom: 4.0,
                child: Text('+', style: style),
              ),
              Positioned(
                top: 6.0,
                left: 28.0,
                child: Text('/', style: style.copyWith(fontSize: 36.0)),
              ),
              Positioned(
                right: 12.0,
                top: 4.0,
                child: Text('-', style: style),
              ),
            ],
          )
        : Text(command.value, style: style);
  }

  double _width(double width, {double expanded = 16.0}) {
    return larger ? (width * 2) + expanded : width;
  }

  ShapeBorder get _shape {
    return larger
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          )
        : CircleBorder();
  }
}
