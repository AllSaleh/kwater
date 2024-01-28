import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomElevatedButton(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: kPrimaryColor,
            minimumSize: Size(MediaQuery.sizeOf(context).width * .6, 50),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: AppStyls.styleregulard22(context),
          )),
    );
  }
}
