import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

class CustomIcategorises extends StatelessWidget {
  const CustomIcategorises({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          'اسلاميه',
          style: AppStyls.styleregulard22(context),
        )),
      ),
    );
  }
}
