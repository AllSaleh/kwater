import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';


class CsutomSearchTextField extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onTap;
  final void Function(String) onFieldSubmitted;
  final bool autofocus;
  const CsutomSearchTextField({
    super.key,
    this.autofocus = false, required this.controller,  required this.onTap, required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      style: AppStyls.styleregulard22(context),
      controller: controller,
      cursorColor: Colors.white,
      cursorHeight: 25,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.search, color: Colors.white)),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          hintText: 'search'.tr(),
          hintStyle: AppStyls.styleMeduim20(context),
          border: const UnderlineInputBorder(borderSide: BorderSide.none)),
          onFieldSubmitted: onFieldSubmitted,
          onChanged:onFieldSubmitted ,
    );
  }
}
