import 'package:flutter/material.dart';
import "dart:math" show pi;

import 'button.dart';

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.0,
      height: 560.0,
      decoration: BoxDecoration(
        color: Color(0XCC886E34),
        borderRadius: BorderRadius.all(Radius.circular(26.0)),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 22.0),
        decoration: BoxDecoration(
          color: Color(0X40886E34),
          borderRadius: BorderRadius.all(Radius.circular(26.0)),
        ),
        child: ClipPath(
          clipper: KeyboardCustomClipper(),
          child: new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26.0),
                bottomRight: Radius.circular(26.0),
              ),
              color: Color(0XFFEFDFBB),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button.red(value: 'C'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutLength = 12.0;
    double radius = 30.0;

    var path = Path();
    path.moveTo(cutLength, 0.0);
    path.lineTo(size.width - cutLength, 0.0);
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - radius - cutLength, radius),
          radius: radius),
      1.5 * pi,
      0.5 * pi,
      true,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.arcTo(
      Rect.fromCircle(
          center: Offset(radius + cutLength, radius), radius: radius),
      1.0 * pi,
      0.5 * pi,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
