import 'package:flutter/material.dart';
import 'package:retro_calculator/models/calculator.dart';
import "dart:math" show pi;

import 'buttons.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  final void Function(Command) onCalculate;

  Keyboard(this.onCalculate);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: Color(0XCC886E34),
        borderRadius: BorderRadius.all(Radius.circular(26.0)),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 26.0),
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
              color: Color(0XCCEFDFBB),
            ),
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                Buttons([
                  Button.red(command: Command.clean, onTap: onCalculate),
                  Button.green(command: Command.plus_minus, onTap: onCalculate),
                  Button.green(
                      command: Command.percentage,
                      fontSize: 36.0,
                      onTap: onCalculate),
                  Button.green(
                      command: Command.multiplication,
                      top: 20.0,
                      onTap: onCalculate),
                ]),
                Buttons([
                  Button.gray(command: Command.one, onTap: onCalculate),
                  Button.gray(command: Command.two, onTap: onCalculate),
                  Button.gray(command: Command.three, onTap: onCalculate),
                  Button.green(command: Command.division, onTap: onCalculate),
                ]),
                Buttons([
                  Button.gray(command: Command.four, onTap: onCalculate),
                  Button.gray(command: Command.five, onTap: onCalculate),
                  Button.gray(command: Command.six, onTap: onCalculate),
                  Button.green(
                      command: Command.subtraction, onTap: onCalculate),
                ]),
                Buttons([
                  Button.gray(command: Command.seven, onTap: onCalculate),
                  Button.gray(command: Command.eight, onTap: onCalculate),
                  Button.gray(command: Command.nine, onTap: onCalculate),
                  Button.green(command: Command.addition, onTap: onCalculate),
                ]),
                Buttons([
                  Button.gray(
                      command: Command.zero, larger: true, onTap: onCalculate),
                  Button.gray(command: Command.dot, onTap: onCalculate),
                  Button.red(
                      command: Command.equals,
                      fontSize: 48.0,
                      onTap: onCalculate),
                ]),
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
