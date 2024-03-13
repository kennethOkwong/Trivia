import 'package:flutter/material.dart';

Widget spaceV(double value) {
  return SizedBox(height: value);
}

Widget spaceH(double value) {
  return SizedBox(width: value);
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

EdgeInsetsGeometry paddingH(double value) {
  return EdgeInsets.symmetric(horizontal: value);
}

EdgeInsetsGeometry paddingV(double value) {
  return EdgeInsets.symmetric(vertical: value);
}

EdgeInsetsGeometry paddingA(double value) {
  return EdgeInsets.all(value);
}
