import 'package:flutter/material.dart';
import 'package:YksPuanmatik/theme/constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    unselectedWidgetColor: kPrimaryColor,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    centerTitle: true,
    elevation: 10.0,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    fillColor: kSecondaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none,
    ),
  );
}
