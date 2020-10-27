import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF006064);
const kLightBarColor = Color(0xFF00BCD4);
const kBackgroundColor = Color(0xFFB2EBF2);
const kSecondaryColor = Color(0xFFE0F7FA);
const kThirdColor = Color(0xFFFFC107);

// Text Colors
const kLightTextColor = Color(0xFFE0F7FA);
const kDarkTextColor = Color(0xFF006064);

// Animation
const kAnimationDuration = Duration(milliseconds: 200);

// Text Styles
const kLightBarTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryColor,
);

const kDarkBarTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  letterSpacing: 6.0,
  color: kSecondaryColor,
);

const kClassesTextStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.w800,
  fontSize: 12.0,
);

const kTextFieldStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.w800,
  fontSize: 16.0,
);

// Text Field Shadow
const kTextFieldShadow = BoxShadow(
  color: Color(0x40000000),
  blurRadius: 4.0,
  offset: Offset(0, 4),
);

// Text Field BoxDecoration
const kTrueFalseBoxDecoration = BoxDecoration(
  boxShadow: [kTextFieldShadow],
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
);

const kNetBoxDecoration = BoxDecoration(
  boxShadow: [kTextFieldShadow],
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  color: kSecondaryColor,
);
