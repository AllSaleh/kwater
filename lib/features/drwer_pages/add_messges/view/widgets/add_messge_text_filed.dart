import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';

class AddMessgeTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const AddMessgeTextFiled({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: kPrimaryColor,
      cursorHeight: 30,
      maxLines: 12,
      decoration: InputDecoration(
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(15));
  }
}
