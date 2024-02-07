import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/responsive_text.dart';

abstract class AppStyls {
  static TextStyle stylebold22(context) {
    return TextStyle(
      // color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleregular40(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 35),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleregulard22(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleregulard18(context) {
    return TextStyle(
      // color: 
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMeduim20(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleregulard20(context) {
    return TextStyle(
      color: kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold25(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
    );
  }
}
