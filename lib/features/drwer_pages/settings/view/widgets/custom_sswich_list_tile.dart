import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/is_light.dart';
import 'package:khwater/core/styls.dart';

class CustomSwichListTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool) onChanged;
  const CustomSwichListTile(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        dense: true,
        activeColor: kPrimaryColor,
        inactiveThumbColor: Colors.white,
        title: Text(
          title,
          style:
              AppStyls.styleregulard22(context).copyWith(color: isLight() ? Colors.black : Colors.white),
        ),
        value: value,
        onChanged: onChanged);
  }
}
