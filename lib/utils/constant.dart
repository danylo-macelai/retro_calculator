import 'package:flutter/material.dart';

const mPrimaryColor = Color(0xFFF9EDD3);
const mAccentColor = Color(0xFF707070);
const mBackgroundColor = Color(0xFFEFDFBB);

LinearGradient mGradient(
  AlignmentGeometry begin,
  AlignmentGeometry end, {
  List<double> stops = const [1.0, 1.0],
  List<Color> colors = const [
    Color(0XFFFFFFFF),
    Color(0XFFCFCFCF),
  ],
}) {
  return LinearGradient(
    begin: begin,
    end: end,
    stops: stops,
    colors: colors,
  );
}