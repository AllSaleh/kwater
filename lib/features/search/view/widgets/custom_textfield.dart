import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';

class CsutomSearchTextField extends StatelessWidget {
  const CsutomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyls.styleregulard22(context),
      controller: TextEditingController(),
      cursorColor: Colors.white,
      cursorHeight: 25,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search, color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          hintText: 'search'.tr(),
          hintStyle: AppStyls.styleMeduim20(context),
          border: const UnderlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
