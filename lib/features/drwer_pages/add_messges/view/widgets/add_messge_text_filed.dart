import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';

class AddMessgeTextFiled extends StatelessWidget {
  const AddMessgeTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      cursorColor: kPrimaryColor,
      cursorHeight: 30,
      maxLines: 10,
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
