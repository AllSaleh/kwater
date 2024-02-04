import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

SnackBar customSnackBar(BuildContext context, {required String title}) {
  return SnackBar(
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: kPrimaryColor,
      content: Center(
          child: Text(
        title,
        style: AppStyls.styleregulard18(context),
      )));
}
