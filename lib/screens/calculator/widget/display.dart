import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  final String value;

  Display(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.0,
      height: 168.0,
      decoration:
          _decoration(Alignment.topLeft, Alignment.bottomCenter, [0.4, 1.0]),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: _decoration(
            Alignment.bottomCenter, Alignment.topCenter, [0.1, 1.0]),
        child: Container(
          margin: EdgeInsets.all(10.0),
          color: Color(0XFF520000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                child: AutoSizeText(
                  value,
                  minFontSize: 20,
                  maxFontSize: 56,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontSize: 56,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration(
    AlignmentGeometry begin,
    AlignmentGeometry end,
    List<double> stops,
  ) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        stops: stops,
        colors: [Color(0XFFFFFFFF), Color(0XFFCFCFCF)],
      ),
    );
  }
}
