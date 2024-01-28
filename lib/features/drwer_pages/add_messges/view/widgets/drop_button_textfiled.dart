import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

class CustomDropButtonFiled extends StatelessWidget {
  const CustomDropButtonFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint: Text('chooseCategorie'.tr()),
        value: null,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: border(),
            enabledBorder: border(),
            focusedBorder: border()),
        items: [
          ...List.generate(
              5,
              (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    'اسلاميه',
                    style: AppStyls.stylebold22(context)
                        .copyWith(color: kPrimaryColor),
                  )))
        ],
        onChanged: (value) {});
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kPrimaryColor));
  }
}
