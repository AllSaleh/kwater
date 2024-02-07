import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/is_light.dart';
import 'package:khwater/core/styls.dart';

class CustomCategoriTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const CustomCategoriTextFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppStyls.stylebold22(context).copyWith(color: kPrimaryColor),
      cursorColor: kPrimaryColor,
      cursorHeight: 25,
      decoration: InputDecoration(
          enabledBorder: border(),
          focusedBorder: border(),
          hintText: 'categoris'.tr(),
          border: border()),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: isLight() ? kPrimaryColor : Colors.white));
  }
}
